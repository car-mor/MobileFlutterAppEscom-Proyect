const express = require('express');
const router = express.Router();
const {
  getGrupos,
  getGrupoById,
  createGrupo,
  updateGrupo,
  deleteGrupo,
} = require('../controllers/grupo.controller');

// Rutas de grupos
router.get('/', getGrupos); // Obtener todos los grupos
router.get('/:id', getGrupoById); // Obtener un grupo por ID
router.post('/', createGrupo); // Crear un nuevo grupo
router.put('/:id', updateGrupo); // Actualizar un grupo por ID
router.delete('/:id', deleteGrupo); // Eliminar un grupo por ID

module.exports = router;
