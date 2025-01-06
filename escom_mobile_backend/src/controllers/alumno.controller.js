export class AlumnoController{
  constructor (Modelos) {
    this.alumnoModel=Modelos.AlumnoModel
  }

  obtenerTodosLosUsuarios = async (req, res) => {
    try {
      const alumnos = await this.alumnoModel.obtenerTodosLosUsuarios();
      res.json(alumnos);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }; 

  obtenerUsuarioPorCorreo= async (req, res) => {
    try {
      const { id } = req.params;
      const alumno = await Alumno.findByPk(id);
      if (!alumno) return res.status(404).json({ message: 'Alumno no encontrado' });
      res.json(alumno);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };

  obtenerUsuarioPorId = async (req, res) => {
    try {
      const nuevoAlumno = await Alumno.create(req.body);
      res.status(201).json(nuevoAlumno);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
}
