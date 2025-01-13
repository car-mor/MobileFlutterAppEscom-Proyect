export class ProfesorController{
    constructor (Modelos) {
      this.profesorModel=Modelos.ProfesorModel
    }
  
    obtenerHorarioProfesor = async (req, res) => {
      try {
        const { profesor } = req.body
        const alumnos = await this.profesorModel.obtenerHorarioProfesor(profesor);
        res.json(alumnos);
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    }; 
    obtenerListaGrupo = async (req, res) => {
      try {
        const { grupo } = req.body
        const alumnos = await this.profesorModel.obtenerListaGrupo(grupo);
        res.json(alumnos);
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    }; 
    obtenerInformacionProfesor = async (req, res) => {
      try {
        const { profesor } = req.body
        const alumnos = await this.profesorModel.obtenerInformacionProfesor(profesor);
        res.json(alumnos);
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    }; 
    
    pasarAsistencia = async (req, res) => {
      try {
        const { asistencia } = req.body
        const alumnos = await this.profesorModel.pasarAsistencia(asistencia);
        res.json(alumnos);
      } catch (error) {
        res.status(501).json({ error: error.message });
      }
    }; 
    obtenerAsistencia = async (req, res) => {
      try {
        const { materia } = req.body
        const alumnos = await this.profesorModel.obtenerAsistencia(materia);
        res.json(alumnos);
      } catch (error) {
        res.status(501).json({ error: error.message });
      }
    }; 
    guardarCalificacion = async (req, res) => {
      try {
        const { calificaciones } = req.body
        const alumnos = await this.profesorModel.guardarCalificacion(calificaciones);
        res.json(alumnos);
      } catch (error) {
        res.status(501).json({ error: error.message });
      }
    }; 
    obtenerGruposProfesor = async (req, res) => {
      try {
        const { profesor } = req.body
        const grupos = await this.profesorModel.obtenerGruposProfesor(profesor);
        res.json(grupos);
      } catch (error) {
        res.status(501).json({ error: error.message });
      }
    }; 
  }
  