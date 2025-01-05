const { Sequelize } = require('sequelize');
const { Alumno, Profesor, Usuario, Horario, Grupo } = require('./model-init');

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

sequelize.authenticate()
  .then(() => {
    console.log('Conexión a la base de datos exitosa');
    // Sincronizar modelos
    return sequelize.sync({ alter: true });
  })
  .catch(err => console.error('Error de conexión a la base de datos:', err));

module.exports = sequelize;
