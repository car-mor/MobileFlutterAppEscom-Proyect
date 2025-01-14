import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(

    
    BaseOptions(
      baseUrl: 'http://192.168.1.78:3000/api/', // Cambia a tu URL de despliegue
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3), // Tiempo máximo de respuesta
    ),
  );

  Future<dynamic> getMessage() async {
    try {
      final response = await _dio.get('/');
      print(response.data);
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
  Future<List<dynamic>> alumnoHorario(boleta) async {
    try {
      final response = await _dio.post('/alumno',data:{'alumno':boleta});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }

Future<List<dynamic>> alumnoInformacion(boleta) async {
    try {
      final response = await _dio.post('/alumno/informacion',data:{'alumno':boleta});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }
  Future<List<dynamic>> profesorHorario(idProfesor) async {
    try {
      final response = await _dio.post('/profesor/horario',data:{'profesor':idProfesor});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }

Future<List<dynamic>> profesorInformacion(id) async {
    try {
      final response = await _dio.post('/profesor/informacion/',data:{'profesor':id});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }






































  Future<List<dynamic>> consultarProfesores() async {
    try {
      final response = await _dio.get('/alumno/profesores/');
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }

}
