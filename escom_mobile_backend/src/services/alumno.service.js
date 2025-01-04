const AlumnoModel = require('../models/alumno.model');

const getAll = async () => {
  return await AlumnoModel.findAll();
};

const create = async (data) => {
  return await AlumnoModel.create(data);
};

module.exports = {
  getAll,
  create,
};
