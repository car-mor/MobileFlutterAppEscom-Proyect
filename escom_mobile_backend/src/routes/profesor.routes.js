const express = require('express');
const router = express.Router();
const {
  getProfesores,
  getProfesorById,
  createProfesor,
  updateProfesor,
  deleteProfesor,
} = require('../controllers/profesor.controller');

// Rutas de profesores
router.get('/', getProfesores); // Obtener todos los profesores
router.get('/:id', getProfesorById); // Obtener un profesor por ID
router.post('/', createProfesor); // Crear un nuevo profesor
router.put('/:id', updateProfesor); // Actualizar un profesor por ID
router.delete('/:id', deleteProfesor); // Eliminar un profesor por ID

module.exports = router;
