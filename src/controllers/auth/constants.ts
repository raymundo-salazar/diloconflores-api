import { AvoidPaths } from "./types"

export const avoidPaths: AvoidPaths[] = [
	{ path: "/api/auth/login", method: "POST" },
	{ path: "/api/auth/login", method: "GET" },
	{ path: "/api/auth/refresh-token", method: "POST" },
	{ path: "/api/auth/logout", method: "POST" },
	{ path: "/api/health", method: "GET" },
	{ path: "/api/health/liveness", method: "GET" },
	{ path: "/api/health/readiness", method: "GET" },
]

export const sessionTypesExpiration = {
	daily: 24 * 60 * 60 * 1000, // 24 horas
	monthly: 30 * 24 * 60 * 60 * 1000, // 30 dias
}
