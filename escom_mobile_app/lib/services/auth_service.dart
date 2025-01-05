import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> authenticateUser(String curp, String boleta) async {
  final url = Uri.parse('http://localhost:3000/api/auth/login'); // Ajusta la URL si es necesario

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'curp': curp,
      'boleta': boleta,
    }),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body); // Devuelve el token y cualquier otro dato relevante
  } else {
    throw Exception('Error de autenticación: ${response.body}');
  }
}

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token); // Guarda el token en las preferencias compartidas
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token'); // Recupera el token almacenado
}

Future<void> clearToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token'); // Elimina el token cuando el usuario cierre sesión
}
