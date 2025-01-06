import { Router } from 'express'
import { AlumnoController } from '../controllers/alumno.controller.js'

export const alumnoRouter = (Modelos) => {
  const alumnoRouter = Router()
  const alumnoController = new AlumnoController (Modelos)

  alumnoRouter.get('/', alumnoController.obtenerTodosLosUsuarios)
  alumnoRouter.get('/:Correo', alumnoController.obtenerUsuarioPorCorreo)
  alumnoRouter.get('/identificador/:id', alumnoController.obtenerUsuarioPorId)

  return alumnoRouter
}

