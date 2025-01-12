import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.103:3000/api/', // Cambia a tu URL de despliegue
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3), // Tiempo máximo de respuesta
    ),
  );

  Future<dynamic> getMessage() async {
    try {
      final response = await _dio.get('/');
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo conectar al servidor');
    }
  }

  Future<List<dynamic>> autentificacion(boleta, contrasena) async {
    try {
      final response = await _dio.post('/auth',data:{'usuario':boleta,'contrasena':contrasena});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }
}
