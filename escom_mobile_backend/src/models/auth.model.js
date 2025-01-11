import { connectionMySQL } from '../config/db.js'

export class AuthModel{
  static async autentificarUsuario (usuarioI, contrasena) {
    try{
      let [usuario] = await connectionMySQL.query(`
        SELECT 
            CASE
                WHEN u.boleta IS NOT NULL THEN u.boleta
                WHEN u.idProfesores IS NOT NULL THEN u.idProfesores
            END AS usuario,
            CASE
                WHEN u.boleta IS NOT NULL THEN 'alumno'
                WHEN u.idProfesores IS NOT NULL THEN 'profesor'
            END AS tipoUsuario
        FROM 
            moviles.usuarios u
        WHERE 
            (u.boleta = ? OR u.idProfesores = ?) -- Reemplaza con el usuario ingresado
            AND u.contrasena = ?;`,[usuarioI,usuarioI,contrasena])
            if(usuario.length===0){
                usuario=[{ resultado: "Credenciales erroneas" }]
            }
      return usuario
    }
    catch(error){
      console.error("Error al obtener el usuario:", error);
      throw error;
    }
  }
}