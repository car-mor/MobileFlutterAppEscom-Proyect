import { Router } from 'express'
import { ProfesorController } from '../controllers/profesor.controller.js'

export const profesorRouter = (Modelos) => {
  const profesorRouter = Router()
  const profesorController = new ProfesorController (Modelos)

  profesorRouter.post('/horario', profesorController.obtenerHorarioProfesor)
  profesorRouter.post('/lista/', profesorController.obtenerListaGrupo)

  return profesorRouter
}

