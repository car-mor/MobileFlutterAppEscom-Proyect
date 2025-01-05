const jwt = require('jsonwebtoken');
const { Usuario } = require('../models/usuario.model');
const bcrypt = require('bcryptjs'); // Asegúrate de que la boleta o contraseña esté cifrada

const authenticate = async (req, res) => {
  const { curp, boleta } = req.body;

  try {
    // Buscar al usuario con el CURP proporcionado
    const usuario = await Usuario.findOne({ where: { curp } });

    if (!usuario) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Compara la boleta proporcionada con la boleta almacenada en la base de datos
    const isValid = await bcrypt.compare(boleta, usuario.boleta); // Suponiendo que la boleta está cifrada

    if (!isValid) {
      return res.status(401).json({ message: 'Credenciales incorrectas' });
    }

    // Generar el token JWT
    const token = jwt.sign(
      { userId: usuario.id, curp: usuario.curp }, // Aquí se puede agregar más info
      process.env.JWT_SECRET, // Se debe configurar una clave secreta en el .env
      { expiresIn: '1h' } // El token expirará en 1 hora, por ejemplo
    );

    // Enviar la respuesta con el token
    res.json({ token });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { authenticate };
