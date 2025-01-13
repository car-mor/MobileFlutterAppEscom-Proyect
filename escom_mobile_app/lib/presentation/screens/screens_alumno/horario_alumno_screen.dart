import '../../../config/helpers/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Datos {
  List<Map<String, String>> horarioTabla;

  Datos({
    required this.horarioTabla,
  });
}

final dato = <Datos>[
  Datos(
    horarioTabla: [],
  ),
];

class HorarioAlumnoScreen extends ConsumerStatefulWidget {
  static const String name = 'horario_alumno_screen';
  const HorarioAlumnoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HorarioTutorialScreenState();
}
var boleta;
class _HorarioTutorialScreenState extends ConsumerState<HorarioAlumnoScreen> {
  final ApiService _apiService = ApiService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    cargarApi();
  }

  Future<void> cargarApi() async {
    setState(() {
      isLoading = true; // Inicia el estado de carga
    });
    final prefs = await SharedPreferences.getInstance();
    boleta = prefs.getString('boleta');

    // Asegúrate de manejar un posible null en `boleta`.
    if (boleta != null) {
      final response = await _apiService.alumnoHorario(boleta);

      // Verifica si response es una lista de mapas.
      setState(() {
        // Limpia la lista actual antes de agregar nuevos datos, si es necesario.
        dato.first.horarioTabla.clear();

        // Mapea los elementos del response a la estructura requerida.
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            dato.first.horarioTabla.add({
              'alumno_nombre': item['alumno_nombre'] ?? '',
              'grupo': item['grupo'] ?? '',
              'materia': item['materia'] ?? '',
              'laboratorio': item['laboratorio'] ?? '',
              'profesor_nombre': item['profesor_nombre'] ?? '',
              'lunes': item['lunes'] ?? '-',
              'martes': item['martes'] ?? '-',
              'miercoles': item['miercoles'] ?? '-',
              'jueves': item['jueves'] ?? '-',
              'viernes': item['viernes'] ?? '-',
            });
          }
        }
      });
    }
    isLoading = false;
  }

   

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Horario Alumno')),
        body: const Center(
          child: CircularProgressIndicator(), // Indicador de carga
        ),
      );
    }
    
    String nombreAlumno = dato.first.horarioTabla.isNotEmpty
      ? dato.first.horarioTabla.first['alumno_nombre'] ?? 'N/A'
      : 'Sin datos';
    return Scaffold(
      appBar: AppBar(title: const Text('Horario Alumno')),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear al inicio
          children: [
            // Texto encima de la tabla
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nombre: $nombreAlumno\nBoleta: $boleta',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
              
            ),
            // Contenedor de la tabla
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Grupo')),
                  DataColumn(label: Text('Materia')),
                  DataColumn(label: Text('Laboratorio')),
                  DataColumn(label: Text('Profesor')),
                  DataColumn(label: Text('Lunes')),
                  DataColumn(label: Text('Martes')),
                  DataColumn(label: Text('Miércoles')),
                  DataColumn(label: Text('Jueves')),
                  DataColumn(label: Text('Viernes')),
                ],
                rows: dato.first.horarioTabla
                    .map(
                      (row) => DataRow(
                        cells: [
                          DataCell(Text(row['grupo']!)),
                          DataCell(Text(row['materia']!)),
                          DataCell(Text(row['laboratorio']!)),
                          DataCell(Text(row['profesor_nombre']!)),
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
      ),
    );
  }
}