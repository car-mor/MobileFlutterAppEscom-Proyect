const { Horario } = require('../models/horario.model');

const findAllHorarios = () => Horario.findAll();
const findHorarioById = (id) => Horario.findByPk(id);
const createHorario = (data) => Horario.create(data);
const updateHorario = (id, data) => Horario.update(data, { where: { id } });
const deleteHorario = (id) => Horario.destroy({ where: { id } });

module.exports = {
  findAllHorarios,
  findHorarioById,
  createHorario,
  updateHorario,
  deleteHorario,
};
