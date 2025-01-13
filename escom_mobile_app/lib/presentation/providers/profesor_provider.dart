import 'package:escom_mobile_app/presentation/providers/api_provider.dart';
import 'package:escom_mobile_app/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/helpers/dio_helper.dart';

final profesorInfoProvider = StateNotifierProvider<ProfesorInfoNotifier, Profesor>((ref) {
  final apiService = ref.watch(apiServiceProvider); // Obtenemos la instancia del ApiService desde el provider
  return ProfesorInfoNotifier(apiService: apiService);  // Pasamos el ApiService al constructor de ProfesorInfoNotifier
});

class ProfesorInfoNotifier extends StateNotifier<Profesor> {
  final ApiService apiService;  // Referencia a ApiService

  ProfesorInfoNotifier({required this.apiService}) 
      : super(Profesor(name: '',
  cargo: '',
  departamento: '',
  telefono: '',
  correo: '',
  curp: ''));

  Future<void> fetchProfesorInfo(String id) async {
    try {
      final response = await apiService.profesorInformacion(id); // Usamos el ApiService
      print("Respuesta obtenida: $response"); // Imprime la respuesta del servidor

      if (response.isNotEmpty) {
        var data = response[0];
        print("Datos procesados: $data"); // Imprime los datos procesados
        state = Profesor(
          name: data['profesor_nombre'] ?? '',
          cargo: data['cargo'] ?? '',
          departamento: data['departamento'] ?? '',
          telefono: data['telefono'] ?? '',
          correo: data['correo'] ?? '',
          curp: data['curp'] ?? '',

        );
        print("Estado actualizado: $state"); // Verifica el estado actualizado
      } else {
        print("Respuesta vacía del servidor.");
        state = Profesor(name: '',
  cargo: '',
  departamento: '',
  telefono: '',
  correo: '',
  curp: '');
      }
    } catch (e) {
      print("Error al obtener la información del alumno: $e");
      state = Profesor(name: '',
  cargo: '',
  departamento: '',
  telefono: '',
  correo: '',
  curp: '');
      throw Exception("Error al obtener la información del alumno");
    }
  }
}