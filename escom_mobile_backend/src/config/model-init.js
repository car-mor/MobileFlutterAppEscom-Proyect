const { DataTypes } = require('sequelize');
const sequelize = require('./db'); // Conexión a la base de datos

// Modelo Usuario
const Usuario = sequelize.define('Usuario', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  identifier: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  tipoUsuario: {
    type: DataTypes.ENUM('alumno', 'profesor'),
    allowNull: false,
  },
});

// Modelo Alumno
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
  },
  correo: {
    type: DataTypes.STRING,
    unique: true,
  },
});

// Modelo Profesor
const Profesor = sequelize.define('Profesor', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  curp: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  cargo: {
    type: DataTypes.STRING,
  },
  departamento: {
    type: DataTypes.STRING,
  },
  telefono: {
    type: DataTypes.STRING,
  },
  correo: {
    type: DataTypes.STRING,
    unique: true,
  },
});

// Modelo Grupo
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
    type: DataTypes.TIME,
    allowNull: false,
  },
  horaTermino: {
    type: DataTypes.TIME,
    allowNull: false,
  },
});

// Modelo Horario
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
  curpProfesor: { // Cambiar el nombre a algo como "profesorId" para mayor claridad
    type: DataTypes.INTEGER, // Cambiar a INTEGER
    allowNull: false,
  },
  idGrupo: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});


// Relaciones
Usuario.hasOne(Alumno, { foreignKey: 'usuarioId' });
Alumno.belongsTo(Usuario, { foreignKey: 'usuarioId' });

Usuario.hasOne(Profesor, { foreignKey: 'usuarioId' });
Profesor.belongsTo(Usuario, { foreignKey: 'usuarioId' });

Alumno.hasMany(Horario, { foreignKey: 'boleta' });
Horario.belongsTo(Alumno, { foreignKey: 'boleta' });

Profesor.hasMany(Horario, { foreignKey: 'curpProfesor' });
Horario.belongsTo(Profesor, { foreignKey: 'curpProfesor' });

Grupo.hasMany(Horario, { foreignKey: 'idGrupo' });
Horario.belongsTo(Grupo, { foreignKey: 'idGrupo' });

// Exportar modelos
module.exports = {
  Usuario,
  Alumno,
  Profesor,
  Grupo,
  Horario,
};
