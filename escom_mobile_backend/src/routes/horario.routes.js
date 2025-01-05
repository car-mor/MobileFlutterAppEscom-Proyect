const express = require('express');
const router = express.Router();
const {
  getHorarios,
  getHorarioById,
  createHorario,
  updateHorario,
  deleteHorario,
} = require('../controllers/horario.controller');

// Rutas de horarios
router.get('/', getHorarios); // Obtener todos los horarios
router.get('/:id', getHorarioById); // Obtener un horario por ID
router.post('/', createHorario); // Crear un nuevo horario
router.put('/:id', updateHorario); // Actualizar un horario por ID
router.delete('/:id', deleteHorario); // Eliminar un horario por ID

module.exports = router;
