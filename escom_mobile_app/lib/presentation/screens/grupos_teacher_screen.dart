import 'package:flutter/material.dart';

class GruposTeacherScreen extends StatelessWidget {
  static const String name = 'grupos_teacher_screen';

  const GruposTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grupos Profesor')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Grupos Asignados al Profesor'),
            // Aquí iría el listado de grupos asignados al profesor
          ],
        ),
      ),
    );
  }
}
