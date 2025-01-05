const { Alumno } = require('../models/alumno.model');

exports.getAlumnos = async (req, res) => {
  try {
    const alumnos = await Alumno.findAll();
    res.json(alumnos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}; 

exports.getAlumnoById = async (req, res) => {
  try {
    const { id } = req.params;
    const alumno = await Alumno.findByPk(id);
    if (!alumno) return res.status(404).json({ message: 'Alumno no encontrado' });
    res.json(alumno);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.createAlumno = async (req, res) => {
  try {
    const nuevoAlumno = await Alumno.create(req.body);
    res.status(201).json(nuevoAlumno);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.updateAlumno = async (req, res) => {
  try {
    const { id } = req.params;
    const alumno = await Alumno.findByPk(id);
    if (!alumno) return res.status(404).json({ message: 'Alumno no encontrado' });

    await alumno.update(req.body);
    res.json(alumno);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteAlumno = async (req, res) => {
  try {
    const { id } = req.params;
    const alumno = await Alumno.findByPk(id);
    if (!alumno) return res.status(404).json({ message: 'Alumno no encontrado' });

    await alumno.destroy();
    res.json({ message: 'Alumno eliminado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// module.exports = {
//   getAlumnos,
//   getAlumnoById,
//   createAlumno,
//   updateAlumno,
//   deleteAlumno,
// };
