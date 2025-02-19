import { AvoidPaths } from "./types"

export const avoidPaths: AvoidPaths[] = [
	{ path: "/api/auth/login", method: "POST" },
	{ path: "/api/auth/login", method: "GET" },
	{ path: "/api/auth/refresh-token", method: "POST" },
	{ path: "/api/auth/logout", method: "POST" },
]

export const sessionTypesExpiration = {
	daily: 24 * 60 * 60 * 1000, // 24 horas
	monthly: 30 * 24 * 60 * 60 * 1000, // 30 dias
}
