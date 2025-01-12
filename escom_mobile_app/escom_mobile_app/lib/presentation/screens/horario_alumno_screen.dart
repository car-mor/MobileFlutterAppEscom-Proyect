import 'package:flutter/material.dart';

class HorarioAlumnoScreen extends StatelessWidget {
  static const String name = 'horario_alumno_screen';

  const HorarioAlumnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horario Alumno')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Horario del Alumno'),
            // Aquí iría el contenido relevante, como una tabla o lista de horarios
          ],
        ),
      ),
    );
  }
}
