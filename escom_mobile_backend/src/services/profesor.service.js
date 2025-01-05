const { Profesor } = require('../models/profesor.model');

const findAllProfesores = () => Profesor.findAll();
const findProfesorById = (id) => Profesor.findByPk(id);
const createProfesor = (data) => Profesor.create(data);
const updateProfesor = (id, data) => Profesor.update(data, { where: { id } });
const deleteProfesor = (id) => Profesor.destroy({ where: { id } });

module.exports = {
  findAllProfesores,
  findProfesorById,
  createProfesor,
  updateProfesor,
  deleteProfesor,
};
