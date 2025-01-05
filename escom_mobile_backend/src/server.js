const express = require('express');
const sequelize = require('./config/db');
const { Usuario, Alumno } = require('./config/model-init'); // Importar los modelos

const app = express();

// Middleware
app.use(express.json());

// Sincronizar modelos y luego iniciar el servidor
sequelize
  .sync({ alter: true }) // Sincroniza todos los modelos definidos
  .then(() => {
    console.log('Modelos sincronizados con la base de datos');
    app.listen(3000, () => console.log('Servidor corriendo en http://localhost:3000'));
  })
  .catch(err => console.error('Error al sincronizar los modelos:', err));
