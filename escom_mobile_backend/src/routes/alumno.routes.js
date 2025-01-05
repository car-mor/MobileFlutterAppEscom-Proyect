const express = require('express');
const { 
  getAlumnos, 
  getAlumnoById, 
  createAlumno, 
  updateAlumno, 
  deleteAlumno 
} = require('../controllers/alumno.controller');

const router = express.Router();

router.get('/', getAlumnos);
router.get('/:id', getAlumnoById);
router.post('/', createAlumno);
router.put('/:id', updateAlumno);
router.delete('/:id', deleteAlumno);

module.exports = router;
