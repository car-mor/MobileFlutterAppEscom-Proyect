export class AlumnoController{
  constructor (Modelos) {
    this.alumnoModel=Modelos.AlumnoModel
  }

  obtenerHorarioAlumno = async (req, res) => {
    try {
      const { alumno } = req.body
      console.log(req.body);
      const alumnos = await this.alumnoModel.obtenerHorarioAlumno(alumno);
      res.json(alumnos);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }; 
  
  obtenerInformacionAlumno = async (req, res) => {
    try {
      const alumnos = await this.alumnoModel.obtenerInformacionAlumno(alumno);
      res.json(alumnos);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
}
