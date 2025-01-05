const { Alumno } = require('../models/alumno.model');

const findAllAlumnos = () => Alumno.findAll();
const findAlumnoById = (id) => Alumno.findByPk(id);
const createAlumno = (data) => Alumno.create(data);
const updateAlumno = (id, data) => Alumno.update(data, { where: { id } });
const deleteAlumno = (id) => Alumno.destroy({ where: { id } });

module.exports = {
  findAllAlumnos,
  findAlumnoById,
  createAlumno,
  updateAlumno,
  deleteAlumno,
};
