import { Router } from "express";
import AuthController from "@controllers/auth";

const router = Router();

router.post("/login", AuthController.login);
router.get("/login", (req, res, next) => {
  req.body.email = "gina_colin94@hotmail.com";
  req.body.password = "Pa$$w0rd";
  return AuthController.login(req, res, next);
});
router.post("/refresh-token", AuthController.refreshToken);
router.post("/logout", AuthController.logout);
router.delete("/logout/all", AuthController.logoutAll);

export default router;
