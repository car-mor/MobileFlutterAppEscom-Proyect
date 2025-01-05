const { Sequelize } = require('sequelize');
require('dotenv').config();

// Inicializar la conexión
const sequelize = new Sequelize('escomdb', process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: 'mysql',
});

// Probar la conexión
sequelize
  .authenticate()
  .then(() => console.log('Conexión a la base de datos exitosa'))
  .catch(err => console.error('Error de conexión a la base de datos:', err));

// Exportar la instancia de Sequelize
module.exports = sequelize;
