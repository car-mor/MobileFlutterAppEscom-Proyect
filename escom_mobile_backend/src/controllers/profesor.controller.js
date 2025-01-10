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
  }
  