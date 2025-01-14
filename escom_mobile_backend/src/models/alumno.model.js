import { connectionMySQL } from '../config/db.js'

export class AlumnoModel{
  static async obtenerHorarioAlumno (alumno) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            CONCAT(apellidoPrimero, ' ', apellidoSegundo , ' ', nombre) AS alumno_nombre,
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
            h.boleta = ?`,alumno)
      return usuario
    }
    catch(error){
      console.error("Error al obtener todos los usuarios:", error);
      throw error;
    }
  }

  static async obtenerInformacionAlumno (alumno) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            CONCAT(apellidoPrimero, ' ', apellidoSegundo , ' ', nombre) AS alumno_nombre,
            carrera,
            telefono,
            correo,
            curp
        FROM 
            moviles.alumnos
        WHERE 
            boleta = ?`,alumno)
      return usuario
    }
    catch(error){
      console.error("Error al obtener todos los usuarios:", error);
      throw error;
    }
  }

  static async obtenerProfesores () {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            idProfesores,
            CONCAT(apellidoPrimero, ' ', apellidoSegundo , ' ', nombre) AS profesor_nombre
        FROM 
            moviles.profesores
        WHERE
            nombre NOT IN (
              SELECT
                nombre
              FROM
                moviles.profesores
              WHERE nombre = 'SIN ASIGNAR  ')
        ORDER BY profesor_nombre ASC`)
      return usuario
    }
    catch(error){
      console.error("Error al obtener todos los usuarios:", error);
      throw error;
    }
  }
}