import 'dart:io';

import 'package:escom_mobile_app/config/helpers/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatosP1 {
  List<Map<String, String>> horarioTabla;

  DatosP1({
    required this.horarioTabla,
  });
}

final datoP1 = <DatosP1>[
  DatosP1(
    horarioTabla: [],
  ),
];


class InformacionProfesorScreen extends ConsumerStatefulWidget {
  final String id;
  static const String name = 'informacion_profesor_screen';
  const InformacionProfesorScreen({super.key, required this.id});

  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InformacionProfesorScreen();
}

class _InformacionProfesorScreen extends ConsumerState<InformacionProfesorScreen> {
  late final String id;
  final ApiService _apiService = ApiService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    id=widget.id;
    cargarApi();
  }

  Future<void> cargarApi() async {
    setState(() {
      isLoading = true; // Inicia el estado de carga
    });
    
    // Asegúrate de manejar un posible null en `idProfesor`.
    final response = await _apiService.profesorHorario(id);

    // Verifica si response es una lista de mapas.
    setState(() {
      // Limpia la lista actual antes de agregar nuevos datos, si es necesario.
      datoP1.first.horarioTabla.clear();

      // Mapea los elementos del response a la estructura requerida.
      for (var item in response) {
        if (item is Map<String, dynamic>) {
          datoP1.first.horarioTabla.add({
            'salon': item['salon'] ?? '',
            'laboratorio': item['laboratorio'] ?? '',
            'cargo': item['cargo'] ?? '',
            'departamento': item['departamento'] ?? '',
            'profesor_nombre': item['profesor_nombre'] ?? '',
            'grupo': item['grupo'] ?? '',
            'materia': item['materia'] ?? '',
            'lunes': item['lunes'] ?? '-',
            'martes': item['martes'] ?? '-',
            'miercoles': item['miercoles'] ?? '-',
            'jueves': item['jueves'] ?? '-',
            'viernes': item['viernes'] ?? '-',
          });
        }
      }
    });
    
      isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Horario Profesor')),
        body: const Center(
          child: CircularProgressIndicator(), // Indicador de carga
        ),
      );
    }
    
    // Datos de ejemplo (puedes cargarlos dinámicamente usando el id)
    String nombre = datoP1.first.horarioTabla.isNotEmpty
      ? datoP1.first.horarioTabla.first['profesor_nombre'] ?? 'N/A'
      : 'Sin datos';
    String cargo = datoP1.first.horarioTabla.isNotEmpty
      ? datoP1.first.horarioTabla.first['cargo'] ?? 'N/A'
      : 'Sin datos';
    String departamento = datoP1.first.horarioTabla.isNotEmpty
      ? datoP1.first.horarioTabla.first['departamento'] ?? 'N/A'
      : 'Sin datos';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Profesor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo o Avatar
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16.0),
            // Nombre
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            // Cargo
            Text(
              cargo,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            // Departamento
            Text(
              departamento,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            // Departamento
            const Text("\n\nHorario",
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Grupo')),
                  DataColumn(label: Text('Materia')),
                  DataColumn(label: Text('Salón')),
                  DataColumn(label: Text('Laboratorio')),
                  DataColumn(label: Text('Lunes')),
                  DataColumn(label: Text('Martes')),
                  DataColumn(label: Text('Miércoles')),
                  DataColumn(label: Text('Jueves')),
                  DataColumn(label: Text('Viernes')),
                ],
                rows: datoP1.first.horarioTabla
                    .map(
                      (row) => DataRow(
                        cells: [
                          DataCell(Text(row['grupo']!)),
                          DataCell(Text(row['materia']!)),
                          DataCell(Text(row['salon']!)),
                          DataCell(Text(row['laboratorio']!)),
                          DataCell(Text(row['lunes']!)),
                          DataCell(Text(row['martes']!)),
                          DataCell(Text(row['miercoles']!)),
                          DataCell(Text(row['jueves']!)),
                          DataCell(Text(row['viernes']!)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      )
    );
  }
}
