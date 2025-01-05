const { Grupo } = require('../models/grupo.model');
const { Horario } = require('../models/horario.model');

const getGrupos = async (req, res) => {
  try {
    const grupos = await Grupo.findAll({
      include: [Horario], // Incluye relación con horarios
    });
    res.json(grupos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const getGrupoById = async (req, res) => {
  try {
    const { id } = req.params;
    const grupo = await Grupo.findByPk(id, {
      include: [Horario],
    });
    if (!grupo) return res.status(404).json({ message: 'Grupo no encontrado' });
    res.json(grupo);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const createGrupo = async (req, res) => {
  try {
    const nuevoGrupo = await Grupo.create(req.body);
    res.status(201).json(nuevoGrupo);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const updateGrupo = async (req, res) => {
  try {
    const { id } = req.params;
    const grupo = await Grupo.findByPk(id);
    if (!grupo) return res.status(404).json({ message: 'Grupo no encontrado' });

    await grupo.update(req.body);
    res.json(grupo);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const deleteGrupo = async (req, res) => {
  try {
    const { id } = req.params;
    const grupo = await Grupo.findByPk(id);
    if (!grupo) return res.status(404).json({ message: 'Grupo no encontrado' });

    await grupo.destroy();
    res.json({ message: 'Grupo eliminado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getGrupos,
  getGrupoById,
  createGrupo,
  updateGrupo,
  deleteGrupo,
};
