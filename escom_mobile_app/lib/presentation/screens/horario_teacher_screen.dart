import 'package:flutter/material.dart';

class HorarioTeacherScreen extends StatelessWidget {
  static const String name = 'horario_teacher_screen';

  const HorarioTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horario Profesor')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Horario del Profesor'),
            // Aquí iría el contenido relevante, como una tabla o lista de horarios
          ],
        ),
      ),
    );
  }
}
