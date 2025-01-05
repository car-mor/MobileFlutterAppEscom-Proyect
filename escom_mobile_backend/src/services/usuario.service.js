const { Usuario } = require('../models/usuario.model');

const findAllUsuarios = () => Usuario.findAll();
const findUsuarioById = (id) => Usuario.findByPk(id);
const createUsuario = (data) => Usuario.create(data);
const updateUsuario = (id, data) => Usuario.update(data, { where: { id } });
const deleteUsuario = (id) => Usuario.destroy({ where: { id } });

module.exports = {
  findAllUsuarios,
  findUsuarioById,
  createUsuario,
  updateUsuario,
  deleteUsuario,
};
