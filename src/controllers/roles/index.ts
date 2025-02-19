import { ApiController } from "@controllers/ApiController"
import { Roles } from "@models/index"
import { updateRoleSchema, roleSchema } from "./schema"

class RolesController extends ApiController<Roles> {
	protected model = Roles
	protected entity = "roles"
	protected createSchema = roleSchema
	protected updateSchema = updateRoleSchema
}

export default new RolesController()
