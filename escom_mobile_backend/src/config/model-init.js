const { Alumno } = require('../models/alumno.model');
const { Profesor } = require('../models/profesor.model');
const { Usuario } = require('../models/usuario.model');
const { Horario } = require('../models/horario.model');
const { Grupo } = require('../models/grupo.model');

// Relación Alumno - Usuario (1:1)
Alumno.hasOne(Usuario, { foreignKey: 'alumnoId', as: 'usuario' });
Usuario.belongsTo(Alumno, { foreignKey: 'alumnoId', as: 'alumno' });

// Relación Profesor - Usuario (1:1)
Profesor.hasOne(Usuario, { foreignKey: 'profesorId', as: 'usuario' });
Usuario.belongsTo(Profesor, { foreignKey: 'profesorId', as: 'profesor' });

// Relación Horario - Alumno (N:1)
Horario.belongsTo(Alumno, { foreignKey: 'boleta', as: 'alumno' });
Alumno.hasMany(Horario, { foreignKey: 'boleta', as: 'horarios' });

// Relación Horario - Profesor (N:1)
Horario.belongsTo(Profesor, { foreignKey: 'curpProfesor', as: 'profesor' });
Profesor.hasMany(Horario, { foreignKey: 'curpProfesor', as: 'horarios' });

// Relación Horario - Grupo (N:1)
Horario.belongsTo(Grupo, { foreignKey: 'idGrupo', as: 'grupo' });
Grupo.hasMany(Horario, { foreignKey: 'idGrupo', as: 'horarios' });

module.exports = {
  Alumno,
  Profesor,
  Usuario,
  Horario,
  Grupo,
};
