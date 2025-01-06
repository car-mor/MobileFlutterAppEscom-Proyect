import { connectionMySQL } from '../config/db.js'


export class AlumnoModel{
  static async obtenerTodosLosUsuarios () {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            a.nombre AS alumno_nombre,
            a.apellidoPrimero AS alumno_apellido,
            m.materia AS materia,
            m.grupo AS grupo,
            m.salon AS salon,
            m.laboratorio AS laboratorio,
            m.lunes,
            m.martes,
            m.miercoles,
            m.jueves,
            m.viernes,
            (SELECT CONCAT(p.apellidoPrimero, ' ', p.apellidoSegundo , ' ', p.nombre)
            FROM moviles.profesores p
            JOIN moviles.horarios h2 ON p.idProfesores = h2.idProfesor
            WHERE h2.idMateria = m.idMateria
            LIMIT 1) AS profesor_nombre
        FROM 
            moviles.horarios h
        JOIN 
            moviles.alumnos a ON h.boleta = a.boleta
        JOIN 
            moviles.materias m ON h.idMateria = m.idMateria
        WHERE 
            h.boleta = '2024630087'
`
      )
      console.log(usuario);
      return usuario
    }
    catch(error){
      console.error("Error al obtener todos los usuarios:", error);
      throw error;
    }
    
    
  }
}