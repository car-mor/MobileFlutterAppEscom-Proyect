const express = require('express');
const router = express.Router();
const { getAlumnos, createAlumno } = require('../controllers/alumno.controller');

// Rutas
router.get('/', getAlumnos);
router.post('/', createAlumno);

module.exports = router;
