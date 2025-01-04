const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/alumnos', require('./routes/alumno.routes'));
app.use('/api/profesores', require('./routes/profesor.routes'));
app.use('/api/auth', require('./routes/auth.routes'));

module.exports = app;
