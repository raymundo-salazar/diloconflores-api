import { Router } from "express"
import health from "./health"

import ActionTypes from "@controllers/actionTypes"
import ActivityLogs from "@controllers/activityLogs"
import Addresses from "@controllers/addresses"
import AddressTypesController from "@controllers/addressTypes"
import AuthController from "@controllers/auth"
import Cities from "@controllers/cities"
import Countries from "@controllers/countries"
import EntityTypes from "@controllers/entityTypes"
import Permissions from "@controllers/permissions"
import RolesControllers from "@controllers/roles"
import States from "@controllers/states"
import Users from "@controllers/users"

const routes = Router()

routes.use("/health", health)

routes.use("/action-types", ActionTypes.apiRouter())
routes.use("/activity-logs", ActivityLogs.apiRouter())
routes.use("/address-types", AddressTypesController.apiRouter())
routes.use("/addresses", Addresses.apiRouter())
routes.use("/auth", AuthController.apiRouter())
routes.use("/cities", Cities.apiRouter())
routes.use("/countries", Countries.apiRouter())
routes.use("/entity-types", EntityTypes.apiRouter())
routes.use("/permissions", Permissions.apiRouter())
routes.use("/roles", RolesControllers.apiRouter())
routes.use("/states", States.apiRouter())
routes.use("/users", Users.apiRouter())

export default routes
