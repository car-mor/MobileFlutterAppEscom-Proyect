import 'package:escom_mobile_app/data/datasources/remote/auth_datasource.dart';
import 'package:escom_mobile_app/domain/repositories/auth_repository.dart';
import 'package:escom_mobile_app/domain/entities/auth_user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Map<String, dynamic>> register({
    required String identifier,
    required String password,
    required TipoUsuario tipoUsuario,
    required Map<String, dynamic> userData,
  }) async {
    try {
      Map<String, dynamic> registrationData = {
        'identifier': identifier,
        'password': password,
        'tipoUsuario': tipoUsuario.toString().split('.').last,
      };

      // Agregar datos específicos según el tipo de usuario
      if (tipoUsuario == TipoUsuario.alumno) {
        registrationData.addAll({
          'boleta': userData['boleta'],
          'nombre': userData['nombre'],
          'curp': userData['curp'],
          'carrera': userData['carrera'],
          'telefono': userData['telefono'],
          'correo': userData['correo'],
        });
      } else if (tipoUsuario == TipoUsuario.profesor) {
        registrationData.addAll({
          'curp': userData['curp'],
          'nombre': userData['nombre'],
          'cargo': userData['cargo'],
          'departamento': userData['departamento'],
          'telefono': userData['telefono'],
          'correo': userData['correo'],
        });
      }

      final response = await datasource.register(registrationData);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await datasource.login(
        identifier: identifier,
        password: password,
      );

      // Asegurarse de que la respuesta incluye el tipo de usuario y los datos específicos
      if (!response.containsKey('user') || 
          !response['user'].containsKey('tipoUsuario')) {
        throw Exception('Respuesta del servidor inválida');
      }

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> checkAuthStatus(String token) async {
    try {
      final response = await datasource.checkAuthStatus(token);
      
      // Verificar que la respuesta contiene la información necesaria
      if (!response.containsKey('user') || 
          !response['user'].containsKey('tipoUsuario')) {
        throw Exception('Respuesta del servidor inválida');
      }

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Método auxiliar para validar datos requeridos
  void _validateUserData(Map<String, dynamic> userData, TipoUsuario tipo) {
    if (tipo == TipoUsuario.alumno) {
      if (userData['boleta'] == null || 
          userData['nombre'] == null || 
          userData['curp'] == null || 
          userData['carrera'] == null) {
        throw Exception('Faltan datos requeridos para el registro de alumno');
      }
    } else if (tipo == TipoUsuario.profesor) {
      if (userData['curp'] == null || 
          userData['nombre'] == null) {
        throw Exception('Faltan datos requeridos para el registro de profesor');
      }
    }
  }
}