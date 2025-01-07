import { Router } from 'express'
import { AlumnoController } from '../controllers/alumno.controller.js'

export const alumnoRouter = (Modelos) => {
  const alumnoRouter = Router()
  const alumnoController = new AlumnoController (Modelos)

  alumnoRouter.post('/', alumnoController.obtenerHorarioAlumno)

  return alumnoRouter
}

