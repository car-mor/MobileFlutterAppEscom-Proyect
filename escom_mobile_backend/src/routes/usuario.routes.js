const express = require('express');
const router = express.Router();
const {
  getUsuarios,
  getUsuarioById,
  createUsuario,
  updateUsuario,
  deleteUsuario,
} = require('../controllers/usuario.controller');

// Rutas de usuarios
router.get('/', getUsuarios); // Obtener todos los usuarios
router.get('/:id', getUsuarioById); // Obtener un usuario por ID
router.post('/', createUsuario); // Crear un nuevo usuario
router.put('/:id', updateUsuario); // Actualizar un usuario por ID
router.delete('/:id', deleteUsuario); // Eliminar un usuario por ID

module.exports = router;
