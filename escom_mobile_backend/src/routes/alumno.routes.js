import { Router } from 'express'
import { AlumnoController } from '../controllers/alumno.controller.js'

export const alumnoRouter = (Modelos) => {
  const alumnoRouter = Router()
  const alumnoController = new AlumnoController (Modelos)

  alumnoRouter.post('/', alumnoController.obtenerHorarioAlumno)
  alumnoRouter.post('/informacion', alumnoController.obtenerInformacionAlumno)
  alumnoRouter.get('/profesores', alumnoController.obtenerProfesores)

  return alumnoRouter
}

