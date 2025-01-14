import { Router } from 'express'
import { ProfesorController } from '../controllers/profesor.controller.js'

export const profesorRouter = (Modelos) => {
  const profesorRouter = Router()
  const profesorController = new ProfesorController (Modelos)

  profesorRouter.post('/horario', profesorController.obtenerHorarioProfesor)
  profesorRouter.post('/lista/', profesorController.obtenerListaGrupo)
  profesorRouter.post('/informacion', profesorController.obtenerInformacionProfesor)
  profesorRouter.post('/asistencia', profesorController.pasarAsistencia)
  profesorRouter.post('/asistencia/obtener', profesorController.obtenerAsistencia)
  profesorRouter.post('/calificacion', profesorController.guardarCalificacion)
  
  profesorRouter.post('/grupos', profesorController.obtenerGruposProfesor)

  return profesorRouter
}

