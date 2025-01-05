const { Profesor } = require('../models/profesor.model');

const getProfesores = async (req, res) => {
  try {
    const profesores = await Profesor.findAll();
    res.json(profesores);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getProfesorById = async (req, res) => {
  try {
    const { id } = req.params;
    const profesor = await Profesor.findByPk(id);
    if (!profesor) return res.status(404).json({ message: 'Profesor no encontrado' });
    res.json(profesor);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const createProfesor = async (req, res) => {
  try {
    const nuevoProfesor = await Profesor.create(req.body);
    res.status(201).json(nuevoProfesor);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const updateProfesor = async (req, res) => {
  try {
    const { id } = req.params;
    const profesor = await Profesor.findByPk(id);
    if (!profesor) return res.status(404).json({ message: 'Profesor no encontrado' });

    await profesor.update(req.body);
    res.json(profesor);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const deleteProfesor = async (req, res) => {
  try {
    const { id } = req.params;
    const profesor = await Profesor.findByPk(id);
    if (!profesor) return res.status(404).json({ message: 'Profesor no encontrado' });

    await profesor.destroy();
    res.json({ message: 'Profesor eliminado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getProfesores,
  getProfesorById,
  createProfesor,
  updateProfesor,
  deleteProfesor,
};
