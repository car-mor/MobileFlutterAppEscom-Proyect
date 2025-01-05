import 'package:dio/dio.dart';

class AuthDatasource {
  final Dio dio;

  AuthDatasource({required this.dio});

  Future<Map<String, dynamic>> register(Map<String, dynamic> registrationData) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: registrationData,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Datos de registro inválidos');
      }
      if (e.response?.statusCode == 409) {
        throw Exception('El usuario ya existe');
      }
      throw Exception('Error en el registro: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'identifier': identifier,
        'password': password,
      });

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Credenciales incorrectas');
      }
      throw Exception('Error en el login: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Token inválido o expirado');
      }
      throw Exception('Error al verificar estado de autenticación: ${e.message}');
    }
  }
}