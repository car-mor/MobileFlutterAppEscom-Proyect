import 'package:escom_mobile_app/presentation/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Proveedor para obtener los grupos del profesor
final profesorGruposProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>(
        (ref, profesorId) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.profesorGrupos(profesorId);

  // Asegúrate de que el tipo sea List<Map<String, dynamic>>:
  return response.map((e) => Map<String, dynamic>.from(e)).toList();
});

// Proveedor para la asistencia del grupo
final asistenciaProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>(
        (ref, grupoId) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.obtenerAsistencia(grupoId);

  // Asegúrate de que el tipo sea List<Map<String, dynamic>>:
  return response.map((e) => Map<String, dynamic>.from(e)).toList();
});

// Proveedor para la lista del grupo
final listaProvider = FutureProvider.family<List<Map<String, dynamic>>, String>(
    (ref, grupoId) async {
  final apiService = ref.read(apiServiceProvider);

  // Llama al método `profesorLista` para obtener los datos.
  final response = await apiService.profesorLista(grupoId);

  // Devuelve la lista procesada.
  return response.map((e) => Map<String, dynamic>.from(e)).toList();
});

final registrarAsistenciaProvider =
    FutureProvider.family<void, Map<String, dynamic>>(
  (ref, asistencia) async {
    final apiService = ref.read(apiServiceProvider);
    await apiService.registrarAsistencia(asistencia);
  },
);

final materiasProvider =
    FutureProvider.family<Map<String, String>, String>((ref, grupoId) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.profesorLista(grupoId);

  // Crea un mapa {boleta: materia_nombre}.
  return Map.fromEntries(response.map((e) {
    return MapEntry(e['boleta'].toString(), e['materia_nombre']);
  }));
});

