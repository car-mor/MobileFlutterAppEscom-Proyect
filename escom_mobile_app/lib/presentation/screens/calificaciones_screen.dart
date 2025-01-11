import 'package:flutter/material.dart';

class CalificacionesScreen extends StatelessWidget {
  static const String name = 'calificaciones_screen';

  const CalificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calificaciones')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Calificaciones del Alumno'),
            // Aquí iría el listado de calificaciones o gráficos
          ],
        ),
      ),
    );
  }
}
