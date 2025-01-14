import '../../../config/helpers/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatosP {
  List<Map<String, String>> horarioTabla;

  DatosP({
    required this.horarioTabla,
  });
}

final datoP = <DatosP>[
  DatosP(
    horarioTabla: [],
  ),
];

class HorarioTeacherScreen extends ConsumerStatefulWidget {
  static const String name = 'horario_teacher_screen';
  const HorarioTeacherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HorarioTeacherScreenState();
}
var idProfesor;
class _HorarioTeacherScreenState extends ConsumerState<HorarioTeacherScreen> {
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
    idProfesor = prefs.getString('idProfesor');

    // Asegúrate de manejar un posible null en `idProfesor`.
    if (idProfesor != null) {
      final response = await _apiService.profesorHorario(idProfesor);

      // Verifica si response es una lista de mapas.
      setState(() {
        // Limpia la lista actual antes de agregar nuevos datos, si es necesario.
        datoP.first.horarioTabla.clear();

        // Mapea los elementos del response a la estructura requerida.
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            datoP.first.horarioTabla.add({
              'salon': item['salon'] ?? '',
              'laboratorio': item['laboratorio'] ?? '',
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
    }
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
    
    String nombreAlumno = datoP.first.horarioTabla.isNotEmpty
      ? datoP.first.horarioTabla.first['profesor_nombre'] ?? 'N/A'
      : 'Sin datos';
    return Scaffold(
      appBar: AppBar(title: const Text('Horario Profesor(a)')),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear al inicio
          children: [
            // Texto encima de la tabla
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nombre: $nombreAlumno\nNum. epleado: $idProfesor',
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
                  DataColumn(label: Text('Salón')),
                  DataColumn(label: Text('Laboratorio')),
                  DataColumn(label: Text('Lunes')),
                  DataColumn(label: Text('Martes')),
                  DataColumn(label: Text('Miércoles')),
                  DataColumn(label: Text('Jueves')),
                  DataColumn(label: Text('Viernes')),
                ],
                rows: datoP.first.horarioTabla
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
      ),
    );
  }
}