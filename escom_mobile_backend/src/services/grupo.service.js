const { Grupo } = require('../models/grupo.model');

const findAllGrupos = () => Grupo.findAll();
const findGrupoById = (id) => Grupo.findByPk(id);
const createGrupo = (data) => Grupo.create(data);
const updateGrupo = (id, data) => Grupo.update(data, { where: { id } });
const deleteGrupo = (id) => Grupo.destroy({ where: { id } });

module.exports = {
  findAllGrupos,
  findGrupoById,
  createGrupo,
  updateGrupo,
  deleteGrupo,
};
