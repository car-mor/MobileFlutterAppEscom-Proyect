import { Router } from 'express'
import { AuthController } from '../controllers/auth.controller.js'

export const authRouter = (Modelos) => {
  const authRouter = Router()
  const authController = new AuthController (Modelos)

  authRouter.post('/', authController.autentificarUsuario)

  return authRouter
}
