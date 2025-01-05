const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Horario = sequelize.define('Horario', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  boleta: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  curpProfesor: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  idGrupo: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  timestamps: true,
});

module.exports = { Horario };
