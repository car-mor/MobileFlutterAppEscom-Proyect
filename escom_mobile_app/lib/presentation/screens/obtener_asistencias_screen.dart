import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/presentation/providers/asistencia_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObtenerAsistenciasScreen extends ConsumerStatefulWidget {
  static const String name = 'obtener_asistencias_screen';
  const ObtenerAsistenciasScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ObtenerAsistenciasScreenState();
}

class _ObtenerAsistenciasScreenState extends ConsumerState<ObtenerAsistenciasScreen> {
  String? selectedGroup;
  String? profesorId;
  String? selectedDate;
  List<Map<String, dynamic>> asistenciaPorDia = [];
  int? materiaId;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Retrasamos la inicialización para evitar llamadas durante la construcción
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inicializarProfesorId();
    });
  }

  void seleccionarFecha(String fecha, List<Map<String, dynamic>> asistencias) {
    final asistenciasFiltradas = asistencias.where((estudiante) {
      final asistenciasDelDia = estudiante['asistencia'] as List;
      return asistenciasDelDia.any((a) => 
        a['dia'] == fecha && a['asistencia'] == 1
      );
    }).map((estudiante) => {
      'alumno_nombre': estudiante['alumno_nombre'],
      'boleta': estudiante['boleta'],
      'grupo': estudiante['grupo'],
      'materia': estudiante['materia_nombre'],
    }).toList();

    setState(() {
      selectedDate = fecha;
      asistenciaPorDia = asistenciasFiltradas;
    });
  }

  Future<void> inicializarProfesorId() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        profesorId = prefs.getString('idProfesor');
        isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // No hacemos ninguna llamada hasta que estemos inicializados
    if (!isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Obtener Asistencias')),
      body: profesorId == null 
        ? const Center(child: Text('No se encontró ID del profesor'))
        : Consumer(
            builder: (context, ref, child) {
              final profesorGruposState = ref.watch(profesorGruposProvider(profesorId!));
              
              return profesorGruposState.when(
                data: (gruposDisponibles) {
                  if (gruposDisponibles.isEmpty) {
                    return const Center(child: Text('No hay grupos disponibles.'));
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Dropdown de grupos
                          DropdownButtonFormField<String>(
                            value: selectedGroup,
                            decoration: const InputDecoration(
                              labelText: 'Selecciona un grupo',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (newGroup) {
                              setState(() {
                                selectedGroup = newGroup;
                                selectedDate = null;
                                asistenciaPorDia = [];
                              });
                            },
                            items: gruposDisponibles.map<DropdownMenuItem<String>>((grupo) {
                              return DropdownMenuItem<String>(
                                value: grupo['grupo'],
                                child: Text('Grupo: ${grupo['grupo']}'),
                              );
                            }).toList(),
                          ),

                          if (selectedGroup != null) ...[
                            const SizedBox(height: 16),
                            Consumer(
                              builder: (context, ref, _) {
                                final listaState = ref.watch(listaProvider(selectedGroup!));
                                
                                return listaState.when(
                                  data: (estudiantes) {
                                    if (estudiantes.isEmpty) {
                                      return const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text('No hay estudiantes en este grupo'),
                                        ),
                                      );
                                    }

                                    materiaId = estudiantes[0]['id_materia'];
                                    
                                    return Consumer(
                                      builder: (context, ref, _) {
                                        final asistenciaState = ref.watch(
                                          asistenciaProvider(materiaId.toString())
                                        );

                                        return asistenciaState.when(
                                          data: (asistencias) {
                                            final fechas = asistencias
                                              .expand((estudiante) {
                                                final asistenciasEstudiante = estudiante['asistencia'] as List;
                                                return asistenciasEstudiante.map((a) => a['dia'].toString());
                                              })
                                              .toSet()
                                              .toList()
                                              ..sort();

                                            if (fechas.isEmpty) {
                                              return const Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('No hay fechas de asistencia disponibles'),
                                              );
                                            }

                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                DropdownButtonFormField<String>(
                                                  value: selectedDate,
                                                  decoration: const InputDecoration(
                                                    labelText: 'Selecciona una fecha',
                                                    border: OutlineInputBorder(),
                                                  ),
                                                  onChanged: (newDate) {
                                                    if (newDate != null) {
                                                      seleccionarFecha(newDate, asistencias);
                                                    }
                                                  },
                                                  items: fechas.map<DropdownMenuItem<String>>((fecha) {
                                                    return DropdownMenuItem<String>(
                                                      value: fecha,
                                                      child: Text(fecha),
                                                    );
                                                  }).toList(),
                                                ),

                                                const SizedBox(height: 16),
                                                if (selectedDate != null) ...[
                                                  if (asistenciaPorDia.isEmpty)
                                                    const Padding(
                                                      padding: EdgeInsets.all(16.0),
                                                      child: Text('No hay asistencias registradas para esta fecha'),
                                                    )
                                                  else
                                                    ...asistenciaPorDia.map((estudiante) => Card(
                                                      child: ListTile(
                                                        title: Text(estudiante['alumno_nombre']),
                                                        subtitle: Text(
                                                          'Boleta: ${estudiante['boleta']}\nMateria: ${estudiante['materia']}'
                                                        ),
                                                        trailing: const Icon(
                                                          Icons.check_circle,
                                                          color: Colors.green
                                                        ),
                                                      ),
                                                    )).toList(),
                                                ],
                                              ],
                                            );
                                          },
                                          loading: () => const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: CircularProgressIndicator()
                                            ),
                                          ),
                                          error: (error, _) => Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text('Error al cargar asistencias: $error'),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  loading: () => const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator()
                                    ),
                                  ),
                                  error: (error, _) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('Error al cargar lista: $error'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Text('Error al cargar grupos: $error')
                ),
              );
            },
          ),
    );
  }
}