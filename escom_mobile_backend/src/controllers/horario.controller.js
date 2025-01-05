const { Horario } = require('../models/horario.model');
const { Alumno } = require('../models/alumno.model');
const { Profesor } = require('../models/profesor.model');
const { Grupo } = require('../models/grupo.model');

const getHorarios = async (req, res) => {
  try {
    const horarios = await Horario.findAll({
      include: [Alumno, Profesor, Grupo], // Incluye relaciones
    });
    res.json(horarios);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getHorarioById = async (req, res) => {
  try {
    const { id } = req.params;
    const horario = await Horario.findByPk(id, {
      include: [Alumno, Profesor, Grupo],
    });
    if (!horario) return res.status(404).json({ message: 'Horario no encontrado' });
    res.json(horario);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const createHorario = async (req, res) => {
  try {
    const nuevoHorario = await Horario.create(req.body);
    res.status(201).json(nuevoHorario);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const updateHorario = async (req, res) => {
  try {
    const { id } = req.params;
    const horario = await Horario.findByPk(id);
    if (!horario) return res.status(404).json({ message: 'Horario no encontrado' });

    await horario.update(req.body);
    res.json(horario);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const deleteHorario = async (req, res) => {
  try {
    const { id } = req.params;
    const horario = await Horario.findByPk(id);
    if (!horario) return res.status(404).json({ message: 'Horario no encontrado' });

    await horario.destroy();
    res.json({ message: 'Horario eliminado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getHorarios,
  getHorarioById,
  createHorario,
  updateHorario,
  deleteHorario,
};
