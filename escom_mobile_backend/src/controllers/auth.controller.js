export class AuthController{
    constructor (Modelos) {
      this.authModel=Modelos.AuthModel
    }
  
    autentificarUsuario = async (req, res) => {
      try {
        const { usuario, contrasena } = req.body
        const usuarioI = await this.authModel.autentificarUsuario(usuario, contrasena);
        res.json(usuarioI);
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    }; 
  }
  