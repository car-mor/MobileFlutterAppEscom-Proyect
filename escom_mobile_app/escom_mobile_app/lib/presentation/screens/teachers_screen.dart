import 'package:flutter/material.dart';

class TeachersScreen extends StatelessWidget {
  static const String name = 'teachers_screen';

  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profesores')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Listado de Profesores'),
            // Aquí iría el listado de los profesores disponibles
          ],
        ),
      ),
    );
  }
}
