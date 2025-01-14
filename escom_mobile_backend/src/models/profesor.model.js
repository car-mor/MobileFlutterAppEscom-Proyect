import { connectionMySQL } from '../config/db.js'

export class ProfesorModel{
  static async obtenerHorarioProfesor (profesor) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT
            CONCAT(p.apellidoPrimero, ' ', p.apellidoSegundo , ' ', p.nombre)as profesor_nombre,
            p.cargo,
            d.nombre as departamento,
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
        JOIN
            moviles.academias d ON p.departamento=d.departamento
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
            CONCAT(a.apellidoPrimero, ' ', a.apellidoSegundo , ' ', a.nombre) AS alumno_nombre,
            h.calificaciones as calificacion,
            m.materia AS materia_nombre,
            m.idMateria as id_materia,
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
            h.idMateria = ?
        ORDER BY
            alumno_nombre ASC`,grupo)
      return usuario
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }

  static async obtenerInformacionProfesor (profesor) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT
          p.idProfesores,
          CONCAT(p.apellidoPrimero, ' ', p.apellidoSegundo , ' ', p.nombre)as profesor_nombre,
            p.cargo as cargo,
            d.nombre as departamento,
            p.telefono as telefono,
            p.telefono as telefono,
            p.correo as correo,
            p.curp as curp
        FROM 
          moviles.profesores p
        JOIN
          moviles.academias d ON p.departamento=d.departamento
        WHERE
          p.idProfesores = ?`,profesor)
      return usuario
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }

  static async pasarAsistencia (asistencia) {
    if (!asistencia || !Array.isArray(asistencia)) {
      return { error: 'Datos inválidos. Asegúrate de enviar un array de asistencia.' };
    }

    try {
      // Inserción masiva
      const query = `INSERT INTO moviles.asistencia (boleta, materia, dia, asistencia) VALUES ?`;
      const values = asistencia.map(({ boleta, materia, dia, presente }) => [boleta, materia, dia, presente]);

      await connectionMySQL.query(query, [values]);
      return {message: 'Asistencia registrada exitosamente.' };
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }
  
  static async obtenerAsistencia (materia) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT 
            CONCAT(a.apellidoPrimero, ' ', a.apellidoSegundo , ' ', a.nombre) AS alumno_nombre,
            a.boleta,
            m.grupo,
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'dia', asis.dia,
                    'asistencia', asis.asistencia
                )
            ) AS asistencia
        FROM 
            moviles.asistencia asis
        INNER JOIN moviles.horarios h ON asis.boleta = h.boleta AND asis.materia = h.idMateria
        INNER JOIN moviles.alumnos a ON h.boleta = a.boleta
        INNER JOIN moviles.materias m ON h.idMateria = m.idMateria
        WHERE 
            asis.materia = ? 
        GROUP BY a.boleta, m.grupo
        ORDER BY alumno_nombre ASC`,materia)
      return usuario
    }
    catch(error){
      console.error("Error al obtener usuario:", error);
      throw error;
    }
  }

  static async guardarCalificacion (calificaciones) {
    if (!calificaciones || !Array.isArray(calificaciones)) {
      return { error: 'Datos inválidos. Asegúrate de enviar un array de calificaciones.' };
    }
  
    try {
      for (const { calificaciones: calificacion, boleta, materia } of calificaciones) {
        console.log(calificacion);
        const query = `UPDATE moviles.horarios SET calificaciones = ? WHERE boleta = ? and idMateria = ?`;
        await connectionMySQL.query(query, [calificacion, boleta, materia]);
      }
      
      return { message: 'Calificaciones actualizadas exitosamente.' };
    } catch (error) {
      console.error("Error al actualizar las calificaciones:", error);
      throw error;
    }
  }
  static async obtenerGruposProfesor (profesor) {
    try{
      const [usuario] = await connectionMySQL.query(`
        SELECT
            m.idMateria AS materia
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
}