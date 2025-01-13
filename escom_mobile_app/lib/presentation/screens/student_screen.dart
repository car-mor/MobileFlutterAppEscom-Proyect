import 'package:flutter/material.dart';

// Modelo de datos del alumno
class Student {
  final String name;
  final String carrera;
  final String telefono;
  final String correo;
  final String curp;

  Student({
    required this.name,
    required this.carrera,
    required this.telefono,
    required this.correo,
    required this.curp,
  });

  // Método para convertir un Map en un objeto Student
  factory Student.fromMap(Map<String, dynamic> map) {
  return Student(
    name: map['alumno_nombre'] ?? 'Desconocido',  // Changed from 'name' to 'alumno_nombre'
    correo: map['correo'] ?? 'Desconocido',
    curp: map['curp'] ?? 'Desconocido',
    carrera: map['carrera'] ?? 'Desconocida', 
    telefono: map['telefono'] ?? 'Desconocido',
  );
}
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
            _buildStudentInfoCard(
              icon: Icons.person,
              title: 'Nombre',
              subtitle: student.name,
            ),
            const SizedBox(height: 10),
            _buildStudentInfoCard(
              icon: Icons.email,
              title: 'Correo Electrónico',
              subtitle: student.correo,
            ),
            const SizedBox(height: 10),
            _buildStudentInfoCard(
              icon: Icons.assignment_ind,
              title: 'Boleta',
              subtitle: student.curp,
            ),
            const SizedBox(height: 10),
            _buildStudentInfoCard(
              icon: Icons.credit_card,
              title: 'CURP',
              subtitle: student.curp,
            ),
            const SizedBox(height: 10),
            _buildStudentInfoCard(
              icon: Icons.school,
              title: 'Carrera',
              subtitle: student.carrera,
            ),
          ],
        ),
      ),
    );
  }

  /// Widget reutilizable para las tarjetas de información del alumno
  Widget _buildStudentInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

// Función para obtener los datos del estudiante desde el backend
// Future<Student> fetchStudentData() async {
//   // Simulación de llamada a backend para obtener datos
//   await Future.delayed(const Duration(seconds: 2)); // Simulamos un delay
//   return Student(
//     name: "Juan Pérez",
//     email: "juan.perez@example.com",
//     boleta: "20192020345",
//     curp: "PEPJ980101HDFRNS08",
//     carrera: "Ingeniería en Sistemas Computacionales",
//   );
// }