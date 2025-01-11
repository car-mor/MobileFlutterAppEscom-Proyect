import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  final List<Map<String, String>> timetable = [
    {
      'Grupo': '6CM5',
      'Profesor': 'Juan Pérez',
      'Lunes': '-',
      'Martes': '8:30',
      'Miércoles': '-',
      'Jueves': '8:30',
      'Viernes': '8:30'
    },
    {
      'Grupo': '6CM6',
      'Profesor': 'Ana López',
      'Lunes': '10:00',
      'Martes': '-',
      'Miércoles': '10:00',
      'Jueves': '-',
      'Viernes': '10:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horarios')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Grupo')),
            DataColumn(label: Text('Profesor')),
            DataColumn(label: Text('Lunes')),
            DataColumn(label: Text('Martes')),
            DataColumn(label: Text('Miércoles')),
            DataColumn(label: Text('Jueves')),
            DataColumn(label: Text('Viernes')),
          ],
          rows: timetable
              .map(
                (row) => DataRow(
                  cells: [
                    DataCell(Text(row['Grupo']!)),
                    DataCell(Text(row['Profesor']!)),
                    DataCell(Text(row['Lunes']!)),
                    DataCell(Text(row['Martes']!)),
                    DataCell(Text(row['Miércoles']!)),
                    DataCell(Text(row['Jueves']!)),
                    DataCell(Text(row['Viernes']!)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
