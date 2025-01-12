import 'package:flutter/material.dart';

class AsignarCalificacionesScreen extends StatelessWidget {
  static const String name = 'asignar_calificaciones_screen';

  const AsignarCalificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asignar Calificaciones')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Asignar Calificaciones a los Alumnos'),
            // Aquí iría la interfaz para asignar calificaciones
          ],
        ),
      ),
    );
  }
}
