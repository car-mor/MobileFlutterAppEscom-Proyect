import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  static const String name = 'student_screen';
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
      ),
      body: const _StudentView(),
    );
  }
}

class _StudentView extends StatelessWidget {
  const _StudentView(); //{super.key} es opcional porque solova a existir este widget en este lugar

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
