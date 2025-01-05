import 'package:flutter/material.dart';

class TeachersScreen extends StatelessWidget {

  static const String name = 'teachers_screen';
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profesores'),
      ),
      body: const _TeachersView(),
    );
  }
}


class _TeachersView extends StatelessWidget {
  const _TeachersView(); //{super.key} es opcional porque solova a existir este widget en este lugar

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
