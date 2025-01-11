import 'package:flutter/material.dart';

// Modelo de datos del alumno
class Student {
  final String name;
  final String email;
  final String boleta;
  final String curp;
  final String carrera;

  Student({
    required this.name,
    required this.email,
    required this.boleta,
    required this.curp,
    required this.carrera,required int id, 
  });
}

class StudentScreen extends StatelessWidget {
  static const String name = 'student_screen';

  final Student student; // Recibimos el objeto Student

  const StudentScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Alumno'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Nombre del Alumno
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: const Text('Nombre'),
                subtitle: Text(student.name), // Usamos los datos del alumno
              ),
            ),
            const SizedBox(height: 10),

            // Correo del Alumno
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text('Correo Electrónico'),
                subtitle: Text(student.email), // Usamos los datos del alumno
              ),
            ),
            const SizedBox(height: 10),

            // Boleta del Alumno
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.assignment_ind, color: Colors.blue),
                title: const Text('Boleta'),
                subtitle: Text(student.boleta), // Usamos los datos del alumno
              ),
            ),
            const SizedBox(height: 10),

            // CURP del Alumno
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.blue),
                title: const Text('CURP'),
                subtitle: Text(student.curp), // Usamos los datos del alumno
              ),
            ),
            const SizedBox(height: 10),

            // Carrera del Alumno
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.blue),
                title: const Text('Carrera'),
                subtitle: Text(student.carrera), // Usamos los datos del alumno
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Student> fetchStudentData() async {
  // Aquí iría la lógica para obtener los datos del backend
  // Simulamos con un objeto de ejemplo
  await Future.delayed(const Duration(seconds: 2)); // Simulando una espera
  return Student(
    name: "Juan Pérez",
    email: "juan.perez@example.com",
    boleta: "20192020345",
    curp: "PEPJ980101HDFRNS08",
    carrera: "Ingeniería en Sistemas Computacionales", id: 1,
  );
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<Student>(
    future: fetchStudentData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        return StudentScreen(student: snapshot.data!);
      } else {
        return const Center(child: Text('No data available'));
      }
    },
  );
}
