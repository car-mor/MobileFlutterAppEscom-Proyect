// import 'dart:ffi';

import 'package:flutter/material.dart';

// Modelo de datos del profesor
class Teacher {
  final String name;
  final String email;
  final String employeeId;
  final String departamento;

  Teacher({
    required this.name,
    required this.email,
    required this.employeeId,
    required this.departamento, required int id, 
  });
}

class TeacherScreen extends StatelessWidget {
  static const String name = 'teacher_screen';

  final Teacher teacher; // Recibimos el objeto Teacher

  const TeacherScreen({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Profesor'),
        backgroundColor: const Color(0xFF006699),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Nombre del Profesor
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF006699)),
                title: const Text('Nombre'),
                subtitle: Text(teacher.name), // Usamos los datos del profesor
              ),
            ),
            const SizedBox(height: 10),
 
            // Correo del Profesor
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF006699)),
                title: const Text('Correo Electrónico'),
                subtitle: Text(teacher.email), // Usamos los datos del profesor
              ),
            ),
            const SizedBox(height: 10),

            // ID de Empleado del Profesor
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.badge, color: Color(0xFF006699)),
                title: const Text('ID de Empleado'),
                subtitle: Text(teacher.employeeId), // Usamos los datos del profesor
              ),
            ),
            const SizedBox(height: 10),

            // Departamento del Profesor
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.business, color: Color(0xFF006699)),
                title: const Text('Departamento'),
                subtitle: Text(teacher.departamento), // Usamos los datos del profesor
              ),
            ),
            const SizedBox(height: 10),

            // Cargo del Profesor
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const ListTile(
                leading: Icon(Icons.work, color: Color(0xFF006699)),
                title: Text('Cargo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<Teacher> fetchTeacherData() async {
  // Aquí iría la lógica para obtener los datos del backend
  // Simularemos con un objeto de ejemplo
  await Future.delayed(const Duration(seconds: 2)); // Simulando una espera
  return Teacher(
    id: 1,
    name: "Dr. Ana López",
    email: "ana.lopez@example.com",
    employeeId: "T-2023-001",
    departamento: "Matemáticas", 
  );
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<Teacher>(
    future: fetchTeacherData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        return TeacherScreen(teacher: snapshot.data!);
      } else {
        return const Center(child: Text('No data available'));
      }
    },
  );
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<Teacher> fetchTeacherData() async {
//   final response = await http.get(Uri.parse('https://mi-api.com/teacher'));

//   if (response.statusCode == 200) {
//     // Parseamos los datos de la respuesta JSON
//     final Map<String, dynamic> data = jsonDecode(response.body);
//     return Teacher(
//       name: data['name'],
//       email: data['email'],
//       employeeId: data['employeeId'],
//       departamento: data['departamento'],
//     );
//   } else {
//     throw Exception('Failed to load teacher data');
//   }
// }



