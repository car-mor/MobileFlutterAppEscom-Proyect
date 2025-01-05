import 'package:escom_mobile_app/config/constants/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlumnoDatasource {
  final String _baseUrl = Environment.apiBaseUrl + '/alumnos';
   Future<List<Map<String, dynamic>>> getAllAlumnos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Error al obtener alumnos');
    }
  }

  Future<Map<String, dynamic>> getAlumno(int boleta) async {
    final response = await http.get(Uri.parse('$_baseUrl/$boleta'));
    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(json.decode(response.body));
    } else {
      throw Exception('Error al obtener el alumno');
    }
  }

  Future<void> createAlumno(Map<String, dynamic> alumno) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(alumno),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al crear el alumno');
    }
  }

  Future<void> updateAlumno(int boleta, Map<String, dynamic> alumno) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$boleta'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(alumno),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el alumno');
    }
  }

  Future<void> deleteAlumno(int boleta) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$boleta'));
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar el alumno');
    }
  }
}
