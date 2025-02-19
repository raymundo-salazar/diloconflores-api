import { Router } from "express"
import UsersController from "@controllers/users"

const router = Router()

// Ruta para crear un usuario admin
router.get("/", UsersController.getAll)
router.get("/:id", UsersController.getById)
router.post("/", UsersController.createRecord)
router.put("/:id", UsersController.updateRecord)
router.delete("/:id", UsersController.deleteRecord)
router.options("/", UsersController.options)

router.get("/:id/:associationName(roles)", UsersController.getAssociation)
router.post("/:id/:associationName(roles)", UsersController.setAssociation)
router.delete("/:id/:associationName(roles)", UsersController.deleteAssociation)

export default router
