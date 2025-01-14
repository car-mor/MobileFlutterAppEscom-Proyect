import 'package:escom_mobile_app/presentation/providers/asistencia_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObtenerAsistenciasScreen extends ConsumerStatefulWidget {
  static const String name = 'obtener_asistencias_screen';
  const ObtenerAsistenciasScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ObtenerAsistenciasScreenState();
}

class _ObtenerAsistenciasScreenState
    extends ConsumerState<ObtenerAsistenciasScreen> {
  String? selectedDate;
  List<Map<String, dynamic>> asistenciaPorDia = [];

  void seleccionarFecha(String fecha, List<Map<String, dynamic>> asistencia) {
    setState(() {
      selectedDate = fecha;
      asistenciaPorDia = asistencia
          .where((e) => e['dia'] == fecha && e['asistencia'] == 1)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final materiaId = "1"; // Sustituir con el ID de materia dinámico.
    final asistenciaState = ref.watch(asistenciaProvider(materiaId));

    return Scaffold(
      appBar: AppBar(title: const Text('Obtener Asistencias')),
      body: asistenciaState.when(
        data: (asistencias) {
          // Extraer todas las fechas únicas del registro.
          final fechas = asistencias
              .expand((e) => e['asistencia'])
              .map<String>((e) => e['dia'])
              .toSet()
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  value: selectedDate,
                  hint: const Text('Selecciona una fecha'),
                  onChanged: (newDate) {
                    if (newDate != null) {
                      seleccionarFecha(
                        newDate,
                        asistencias
                            .expand((e) => e['asistencia'].map((a) {
                                  return {
                                    'alumno_nombre': e['alumno_nombre'],
                                    'boleta': e['boleta'],
                                    'grupo': e['grupo'],
                                    'materia': e['materia_nombre'],
                                    ...Map<String, dynamic>.from(a),
                                  };
                                }))
                            .toList()
                            .cast<
                                Map<String,
                                    dynamic>>(), // Asegura el tipo de la lista.
                      );
                    }
                  },
                  items: fechas.map<DropdownMenuItem<String>>((fecha) {
                    return DropdownMenuItem<String>(
                      value: fecha,
                      child: Text(fecha),
                    );
                  }).toList(),
                ),
              ),
              const Divider(),
              if (selectedDate == null)
                const Center(
                  child: Text('Selecciona una fecha para ver asistencias'),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: asistenciaPorDia.length,
                    itemBuilder: (context, index) {
                      final estudiante = asistenciaPorDia[index];
                      return ListTile(
                        title: Text(estudiante['alumno_nombre']),
                        subtitle: Text(
            'Boleta: ${estudiante['boleta']} - Materia: ${estudiante['materia']}'),
                        trailing:
                            const Icon(Icons.check_circle, color: Colors.green),
                      );
                    },
                  ),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error al obtener asistencias: $error')),
      ),
    );
  }
}
