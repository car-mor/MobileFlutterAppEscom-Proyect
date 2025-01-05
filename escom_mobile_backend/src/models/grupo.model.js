const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Grupo = sequelize.define('Grupo', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  grupo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  carrera: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  dia: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  horaInicio: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  horaTermino: {
    type: DataTypes.DATE,
    allowNull: false,
  },
}, {
  timestamps: true,
});

module.exports = { Grupo };
