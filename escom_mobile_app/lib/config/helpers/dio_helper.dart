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

  Future<List<dynamic>> profesorGrupos(id) async {
    try {
      final response = await _dio.post('/profesor/grupos/',data:{'profesor':id});
      return response.data;
    } catch (e) {
      print('Error: $e');
      throw Exception('No se pudo enviar la información');
    }
  }

 Future<List<Map<String, dynamic>>> profesorLista(String grupoId) async {
  try {
    final response = await _dio.post('/profesor/lista/', data: {'grupo': grupoId});

    // Asegurarte de que la respuesta sea una lista de mapas.
    return (response.data as List).map((e) => Map<String, dynamic>.from(e)).toList();
  } catch (e) {
    print('Error al obtener la lista de estudiantes: $e');
    throw Exception('No se pudo obtener la lista de estudiantes');
  }
}

Future<void> registrarAsistencia(Map<String, dynamic> asistencia) async {
  try {
    final response = await _dio.post('/profesor/asistencia', data: asistencia);
    print('Respuesta del servidor: ${response.data}');
  } catch (e) {
    print('Error al registrar la asistencia: $e');
    throw Exception('No se pudo registrar la asistencia');
  }
}


  Future<List<dynamic>> obtenerAsistencia(id) async {
    try {
      final response = await _dio.post('/profesor/asistencia/obtener',data:{'materia':id});
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
