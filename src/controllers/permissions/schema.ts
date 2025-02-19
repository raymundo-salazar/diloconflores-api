import { table } from "console"
import Joi from "joi"

export const permissionSchema = Joi.object({
	code: Joi.string().max(50),
	name: Joi.string().max(50).required(),
	description: Joi.string().max(255).required(),
	table: Joi.string().max(255).required(),
	path: Joi.string().max(255).required(),
	action_template: Joi.string().max(255),
	method: Joi.string().max(10).uppercase().valid("GET", "POST", "PUT", "DELETE").required(),
})

export const updatePermissionSchema = Joi.object({
	code: Joi.string().max(50),
	name: Joi.string().max(50),
	description: Joi.string().max(255),
	table: Joi.string().max(255),
	path: Joi.string().max(255),
	action_template: Joi.string().max(255),
	method: Joi.string().max(10).uppercase().valid("GET", "POST", "PUT", "DELETE"),
})
