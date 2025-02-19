import { Request, Response, NextFunction } from "express"
import { ApiController } from "@controllers/ApiController"
import { Roles, Sessions } from "@models/index"
import { loginSchema, refreshTokenSchema } from "./schema"
import { AuthError, MissingParametersError, NotFoundError } from "@helpers/errors"
import Users from "@models/users"
import { verify } from "jsonwebtoken"
import bcrypt from "bcrypt"
import { successResponse } from "@helpers/response"
import { TokenJwtPayload } from "@controllers/ApiController/types"
import { avoidPaths, sessionTypesExpiration } from "./constants"
import { Op } from "sequelize"
import { convertPermissionToRegex } from "@helpers/auth"
const { JWT_SECRET = "", REFRESH_TOKEN_SECRET = "" } = process.env

class AuthController extends ApiController<Sessions> {
	protected model = Sessions
	protected entity = "session"

	public login = async (req: Request, res: Response, next: NextFunction) => {
		try {
			const { email, password, sessionType = "daily" } = req.body

			const { error } = loginSchema.validate(req.body)
			if (error) {
				throw new MissingParametersError(error.message)
			}

			const user = await Users.findOne({ where: { email } })
			if (!user) throw new AuthError(req.t("api.errors.unathorized"))

			const validPassword = await bcrypt.compare(password, user.password)
			if (!validPassword) throw new AuthError(req.t("api.errors.unathorized"))

			const fingerprint = this.getFingerprint(req, user.uuid)
			await this.model.destroy({
				where: { user_id: user.id, fingerprint, revoked_reason: "NEW_SESSION_TOKEN_CREATED" },
			})

			let expiresAt
			if (sessionType === "daily") expiresAt = new Date(Date.now() + sessionTypesExpiration.daily)
			else expiresAt = new Date(Date.now() + sessionTypesExpiration.monthly)

			const { token: accessToken, hashedToken } = this.createAccessToken(req, user.uuid, expiresAt)
			const { refreshToken, hashedRefreshToken } = this.createRefreshToken(
				req,
				user.uuid,
				expiresAt
			)
			const deviceInfo = this.getDeviceInfo(req)

			await this.model.create({
				user_id: user.id,
				access_token: accessToken,
				access_token_hash: hashedToken,
				refresh_token: refreshToken,
				refresh_token_hash: hashedRefreshToken,
				fingerprint,
				expires_at: expiresAt,
				revoked: false,
				device_type: deviceInfo.deviceType,
				os: deviceInfo.os,
				os_version: deviceInfo.osVersion,
				browser: deviceInfo.browser,
				browser_version: deviceInfo.browserVersion,
				user_agent: deviceInfo.userAgent,
				ip_address: req.ip,
				session_type: sessionType,
			})

			const response = { accessToken: hashedToken, refreshToken: hashedRefreshToken, expiresAt }

			successResponse(req, res, response, req.t("api.session_created"))
		} catch (error) {
			next(error)
		}
	}

	public refreshToken = async (req: Request, res: Response, next: NextFunction) => {
		try {
			const { refresh_token } = req.body
			const access_token = req.headers.authorization?.split(" ")[1]
			if (!access_token) throw new AuthError(req.t("api.errors.unathorized_token"))

			const { error } = refreshTokenSchema.validate(req.body)
			if (error) throw new MissingParametersError(error.message)

			const session = await this.model.findOne({
				where: { refresh_token_hash: refresh_token },
				include: [{ model: Users, as: "user" }],
			})
			if (!session || !session.user)
				throw new AuthError(req.t("api.errors.unathorized_refresh_token"))

			const decoded = (await verify(session.refresh_token, REFRESH_TOKEN_SECRET)) as TokenJwtPayload
			const fingerprint = this.getFingerprint(req, decoded.user)

			if (decoded.fingerprint !== fingerprint)
				throw new AuthError(req.t("api.errors.unathorized_fingerprint"))

			await this.model.destroy({
				where: {
					user_id: session.user.id,
					revoked_reason: "REFRESH_TOKEN",
				},
			})

			let expiresAt
			if (session.session_type === "daily")
				expiresAt = new Date(Date.now() + sessionTypesExpiration.daily)
			else expiresAt = new Date(Date.now() + sessionTypesExpiration.monthly)

			const { token: accessToken, hashedToken } = this.createAccessToken(
				req,
				session.user?.uuid,
				expiresAt
			)
			const { refreshToken, hashedRefreshToken } = this.createRefreshToken(
				req,
				session.user?.uuid,
				expiresAt
			)
			const deviceInfo = this.getDeviceInfo(req)

			await this.model.create({
				user_id: session.user.id,
				access_token: accessToken,
				access_token_hash: hashedToken,
				refresh_token: refreshToken,
				refresh_token_hash: hashedRefreshToken,
				refresh_id: session.id,
				fingerprint,
				expires_at: expiresAt,
				revoked: false,
				device_type: deviceInfo.deviceType,
				os: deviceInfo.os,
				os_version: deviceInfo.osVersion,
				browser: deviceInfo.browser,
				browser_version: deviceInfo.browserVersion,
				user_agent: deviceInfo.userAgent,
				ip_address: req.ip,
				session_type: session.session_type,
			})

			const response = { accessToken: hashedToken, refreshToken: hashedRefreshToken, expiresAt }

			successResponse(req, res, response, req.t("api.session_refreshed"))
		} catch (error) {
			next(error)
		}
	}

	public logout = async (req: Request, res: Response, next: NextFunction) => {
		try {
			const access_token = req.headers.authorization?.split(" ")[1]
			if (!access_token) throw new AuthError(req.t("api.errors.unathorized_token"))

			const session = await this.model.findOne({
				where: { access_token_hash: access_token },
				include: [{ model: Users, as: "user" }],
			})
			if (!session || !session.user) throw new AuthError(req.t("api.errors.unathorized_token"))

			const fingerprint = this.getFingerprint(req, session.user.uuid)
			await this.model.destroy({
				where: { id: session.id, fingerprint, revoked_reason: "LOGOUT_SESSION_BY_USER" },
			})

			successResponse(req, res, null, req.t("api.logout_session"))
		} catch (error) {
			next(error)
		}
	}

	// TODO: Login with MFA.

	public logoutAll = async (req: Request, res: Response, next: NextFunction) => {
		try {
			const { user, session } = req
			const { all = false } = req.params

			const where: {
				id?: object
				user_id: number
			} = {
				user_id: user.id,
			}
			if (!all) where.id = { [Op.ne]: session.id }

			const openSessions = await this.model.count({ where })
			await this.model.destroy({
				where: {
					...where,
					revoked_reason: "LOGOUT_ALL_SESSIONS_BY_USER",
				},
			})

			successResponse(
				req,
				res,
				{ closedSessions: openSessions },
				req.t(`api.${all ? "logout_all_sessions" : "logout_all_sessions_but_this"}`)
			)
		} catch (error) {
			next(error)
		}
	}

	// TODO: Logout all sessions from user. (Only Admin)
	// TODO: Login as user. (Only Admin)

	public validateToken = async (req: Request, res: Response, next: NextFunction) => {
		if (avoidPaths.find(path => path.path === req.path && path.method === req.method)) return next()

		try {
			if (req.headers.authorization?.split(" ")[0] !== "Bearer")
				throw new AuthError(req.t("api.errors.unathorized_bearer"))

			const token = req.headers.authorization?.split(" ")[1]
			if (!token) throw new AuthError(req.t("api.errors.unathorized_token"))

			const session = await this.model.findOne({
				where: { access_token_hash: token },
				include: [{ model: Users, as: "user" }],
			})
			if (!session) throw new AuthError(req.t("api.errors.unathorized_token"))

			const decoded = (await verify(session.access_token, JWT_SECRET)) as TokenJwtPayload
			const fingerprint = this.getFingerprint(req, decoded.user)

			if (decoded.fingerprint !== fingerprint)
				throw new AuthError(req.t("api.errors.unathorized_fingerprint"))

			if (!session.user) throw new NotFoundError(req.t("api.errors.user_not_found"))
			const user = await Users.findByPk(session.user?.id, {
				include: [
					{
						model: Roles,
						as: "roles",
						include: ["permissions"],
					},
				],
			})

			let hasPermission = false
			user?.roles?.map(role => {
				const permissions = role.permissions
					?.filter(p => p.method?.toUpperCase() === req.method.toUpperCase())
					.map(permission => convertPermissionToRegex(permission.path as string))
				hasPermission =
					permissions?.some(regex => regex.test(req.path.replace("/api", ""))) ?? false
			})

			if (!hasPermission) throw new AuthError(req.t("api.errors.forbidden"), 403)

			req.user = session.user
			req.session = session
			next()
		} catch (error: any) {
			if (["invalid signature", "jwt expired"].includes(error.message))
				error = new AuthError(req.t("api.errors.unathorized_token"))
			next(error)
		}
	}
}

export default new AuthController()
