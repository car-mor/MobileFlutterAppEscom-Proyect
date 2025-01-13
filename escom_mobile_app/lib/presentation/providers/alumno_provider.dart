import 'package:escom_mobile_app/presentation/providers/api_provider.dart';
import 'package:escom_mobile_app/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/helpers/dio_helper.dart';

final studentInfoProvider = StateNotifierProvider<StudentInfoNotifier, Student>((ref) {
  final apiService = ref.watch(apiServiceProvider); // Obtenemos la instancia del ApiService desde el provider
  return StudentInfoNotifier(apiService: apiService);  // Pasamos el ApiService al constructor de StudentInfoNotifier
});

class StudentInfoNotifier extends StateNotifier<Student> {
  final ApiService apiService;  // Referencia a ApiService

  StudentInfoNotifier({required this.apiService}) 
      : super(Student(name: '', carrera: '', telefono: '', correo: '', curp: ''));

  Future<void> fetchStudentInfo(String boleta) async {
    try {
      final response = await apiService.alumnoInformacion(boleta); // Usamos el ApiService
      print("Respuesta obtenida: $response"); // Imprime la respuesta del servidor

      if (response.isNotEmpty) {
        var data = response[0];
        print("Datos procesados: $data"); // Imprime los datos procesados

        state = Student(
          name: data['alumno_nombre'] ?? '',
          carrera: data['carrera'] ?? '',
          telefono: data['telefono'] ?? '',
          correo: data['correo'] ?? '',
          curp: data['curp'] ?? '',
        );
        print("Estado actualizado: $state"); // Verifica el estado actualizado
      } else {
        print("Respuesta vacía del servidor.");
        state = Student(name: '', carrera: '', telefono: '', correo: '', curp: '');
      }
    } catch (e) {
      print("Error al obtener la información del alumno: $e");
      state = Student(name: '', carrera: '', telefono: '', correo: '', curp: '');
      throw Exception("Error al obtener la información del alumno");
    }
  }
}