const AlumnoService = require('../services/alumno.service');

const getAlumnos = async (req, res) => {
  try {
    const alumnos = await AlumnoService.getAll();
    res.json(alumnos);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener alumnos', error });
  }
};

const createAlumno = async (req, res) => {
  try {
    const alumno = await AlumnoService.create(req.body);
    res.status(201).json(alumno);
  } catch (error) {
    res.status(500).json({ message: 'Error al crear alumno', error });
  }
};

module.exports = {
  getAlumnos,
  createAlumno,
};
