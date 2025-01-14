import 'package:escom_mobile_app/presentation/providers/api_provider.dart';
import 'package:escom_mobile_app/presentation/providers/asistencia_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsistenciaScreen extends ConsumerStatefulWidget {
  static const String name = 'asistencia_screen';
  const AsistenciaScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AsistenciaScreenState();
}

class _AsistenciaScreenState extends ConsumerState<AsistenciaScreen> {
  bool isLoading = false;
  String? selectedGroup;
  List<Map<String, dynamic>> students = [];
  String? profesorId;

  @override
  void initState() {
    super.initState();
    inicializarProfesorId();
  }

  Future<void> inicializarProfesorId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      profesorId = prefs.getString('idProfesor');
    });
  }

  Future<void> cargarEstudiantes(String grupo) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Usa `ref.read` para evitar re-renderizados innecesarios.
      final estudiantes = await ref.read(listaProvider(grupo).future);

      setState(() {
        isLoading = false;
        students = estudiantes.map((e) {
          return {
            'boleta': e['boleta'],
            'nombre': e['alumno_nombre'], // Solo almacena el nombre.
            'id_materia':
                e['id_materia'], // Lo necesitas para registrar asistencia.
            'presente': false,
          };
        }).toList();
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error al cargar estudiantes: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al cargar estudiantes')),
      );
    }
  }

  String obtenerFechaActual() {
    final DateTime ahora = DateTime.now();
    return "${ahora.year}-${ahora.month.toString().padLeft(2, '0')}-${ahora.day.toString().padLeft(2, '0')}";
  }

  List<Map<String, dynamic>> construirListaAsistencia(
      List<Map<String, dynamic>> estudiantes) {
    final fechaActual =
        DateTime.now().toIso8601String().split('T').first; // YYYY-MM-DD

    // Construir correctamente la lista de asistencia:
    return estudiantes.map((estudiante) {
      return {
        'boleta': estudiante['boleta'],
        'materia':
            estudiante['id_materia'], // Obtén el id_materia del estudiante
        'dia': fechaActual, // La fecha de hoy
        'presente':
            estudiante['presente'] ? 1 : 0, // Convierte el valor a 1 o 0
      };
    }).toList(); // Asegúrate de que sea una lista
  }

  @override
  Widget build(BuildContext context) {
    final profesorGruposState = profesorId != null
        ? ref.watch(profesorGruposProvider(profesorId!))
        : const AsyncValue.loading();

    final registrarAsistenciaProvider =
        FutureProvider.family<void, Map<String, List<Map<String, dynamic>>>>(
      (ref, asistencia) async {
        final apiService = ref.read(apiServiceProvider);
        await apiService.registrarAsistencia(asistencia);
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Asistencia')),
      body: profesorGruposState.when(
        data: (grupos) {
          if (grupos.isEmpty) {
            return const Center(child: Text('No hay grupos disponibles.'));
          }

          if (selectedGroup == null ||
              !grupos.any((g) => g['grupo'] == selectedGroup)) {
            selectedGroup = grupos.first['grupo'];
            Future.microtask(() => cargarEstudiantes(selectedGroup!));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedGroup,
                  onChanged: (newGroup) async {
                    if (newGroup != null && newGroup != selectedGroup) {
                      setState(() {
                        selectedGroup = newGroup;
                        students =
                            []; // Limpia la lista anterior mientras se cargan los nuevos estudiantes.
                      });
                      await cargarEstudiantes(
                          newGroup); // Llama al método para cargar los estudiantes.
                    }
                  },
                  items: grupos.map<DropdownMenuItem<String>>((grupo) {
                    return DropdownMenuItem<String>(
                      value: grupo['grupo'],
                      child: Text(grupo['grupo']),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final estudiante = students[index];
                        return ListTile(
                          title: Text(estudiante['nombre']),
                          subtitle: Text('Boleta: ${estudiante['boleta']}'),
                          trailing: Checkbox(
                            value: estudiante['presente'],
                            onChanged: (bool? value) {
                              setState(() {
                                estudiante['presente'] = value ?? false;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Construye la lista de asistencia.
                      final listaAsistencia =
                          construirListaAsistencia(students);

                      // Envuélvela en un mapa.
                      final datosParaRegistrar = {
                        'asistencia': listaAsistencia
                      };

                      // Llama al provider.
                      await ref.read(
                          registrarAsistenciaProvider(datosParaRegistrar)
                              .future);

                      // Muestra un mensaje de éxito.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Asistencia registrada con éxito')),
                      );
                    } catch (error) {
                      // Manejo de errores.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Error al registrar asistencia: $error')),
                      );
                    }
                  },
                  child: const Text('Registrar Asistencia'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
