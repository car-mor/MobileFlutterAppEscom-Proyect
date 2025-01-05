const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Alumno = sequelize.define('Alumno', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  boleta: {
    type: DataTypes.INTEGER,
    allowNull: false,
    unique: true,
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  curp: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  carrera: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  telefono: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  correo: {
    type: DataTypes.STRING,
    allowNull: true,
    unique: true,
  },
}, {
  timestamps: true,
});

module.exports = { Alumno };
