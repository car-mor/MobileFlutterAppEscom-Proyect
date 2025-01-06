import { connectionMySQL } from '../config/db.js'

export class ProfesorModel{
  static async obtenerHorarioProfesor (profesor) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT
            p.nombre AS profesor_nombre,
            p.apellidoPrimero AS profesor_apellido,
            m.idmateria as id_materia,
            m.materia AS materia,
            m.grupo AS grupo,
            m.salon AS salon,
            m.laboratorio AS laboratorio,
            m.lunes,
            m.martes,
            m.miercoles,
            m.jueves,
            m.viernes
        FROM 
            moviles.horarios h
        JOIN 
            moviles.profesores p ON h.idProfesor = p.idProfesores
        JOIN 
            moviles.materias m ON h.idMateria = m.idMateria
        WHERE 
            p.idProfesores = ?`,profesor)
      return usuario
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }

  static async obtenerListaGrupo (grupo) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            a.boleta,
            a.nombre AS alumno_nombre,
            a.apellidoPrimero AS alumno_apellido1,
            a.apellidoSegundo AS alumno_apellido2,
            m.materia AS materia_nombre,
            m.grupo AS grupo,
            m.salon AS salon,
            m.laboratorio AS laboratorio
        FROM 
            moviles.horarios h
        JOIN 
            moviles.alumnos a ON h.boleta = a.boleta
        JOIN 
            moviles.materias m ON h.idMateria = m.idMateria
        WHERE 
            h.idMateria = ?;`,grupo)
      return usuario
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }
}