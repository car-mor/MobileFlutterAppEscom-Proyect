import 'package:escom_mobile_app/config/helpers/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Profesores {
  List<Map<String, String>> profesor;

  Profesores({
    required this.profesor
  }); 
}

final profesores = <Profesores>[
  Profesores(
    profesor:[]
  ),
];

class ProfesoresScreen extends ConsumerStatefulWidget {
  static const String name = 'buscar_profesores_screen';
  const ProfesoresScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>
  _ProfesoresScreen();
}

class _ProfesoresScreen extends ConsumerState<ProfesoresScreen>{

  final ApiService _apiService = ApiService();
  bool isLoading = true;
  List<Map<String, String>> filteredProfesores = [];

  @override
  void initState() {
    super.initState();
    cargarApi();
  }

  Future<void> cargarApi() async {
    setState(() {
      isLoading = true; // Inicia el estado de carga
    });

    // Asegúrate de manejar un posible null en `boleta`.
    
      final response = await _apiService.consultarProfesores();

      // Verifica si response es una lista de mapas.
      setState(() {
        // Limpia la lista actual antes de agregar nuevos datos, si es necesario.
        profesores.first.profesor.clear(); 

        // Mapea los elementos del response a la estructura requerida.
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            profesores.first.profesor.add({
              'nombre': item['profesor_nombre'] ?? '',
              "id": item['idProfesores']?.toString() ?? '',
            });
          }
        }
        filteredProfesores = List.from(profesores.first.profesor);
      });
    
    isLoading = false;
  }

  void buscarProfesores(String query) {
    setState(() {
      filteredProfesores = profesores.first.profesor.where((profesor) {
        final nombre = profesor['nombre']?.toLowerCase() ?? '';
        final input = query.toLowerCase();
        return nombre.contains(input);
      }).toList();
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profesores')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: buscarProfesores,
                    decoration: const InputDecoration(
                      labelText: 'Buscar profesor',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredProfesores.length,
                      itemBuilder: (context, index) {
                        final profesor = filteredProfesores[index];
                        return ListTile(
                          title: Text(profesor['nombre'] ?? 'Sin nombre'),
                          onTap: () {
                            GoRouter.of(context).push('/informacion_profesor_screen/${profesor['id']}');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}