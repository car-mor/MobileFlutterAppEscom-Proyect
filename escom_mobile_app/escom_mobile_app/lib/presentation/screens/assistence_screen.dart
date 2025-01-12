import 'package:flutter/material.dart';

class AssistenceScreen extends StatelessWidget {
  static const String name = 'assistence_screen';

  const AssistenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asistencia')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Registro de Asistencia'),
            // Aquí iría la funcionalidad para tomar asistencia
          ],
        ),
      ),
    );
  }
}
