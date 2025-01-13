import 'package:flutter/material.dart';

// Modelo de datos del Profesor
class Profesor {
  final String name;
  final String cargo;
  final String departamento;
  final String telefono;
  final String correo;
  final String curp;

  Profesor({
    required this.name,
    required this.cargo,
    required this.departamento,
    required this.telefono,
    required this.correo,
    required this.curp,
  });

  // Método para convertir un Map en un objeto Student
  factory Profesor.fromMap(Map<String, dynamic> map) {
  return Profesor(
    name: map['profesor_nombre'] ?? 'Desconocido',
      cargo: map['cargo'] ?? 'Desconocido',
      departamento: map['departamento'] ?? 'Desconocido',
      telefono: map['telefono'] ?? 'Desconocido',
      correo: map['correo'] ?? 'Desconocido',
      curp: map['curp'] ?? 'Desconocido',
  );
}
}

class ProfesorScreen extends StatelessWidget {
  static const String name = 'profesor_screen';

  final  Profesor profesor; // Identificador del profesor para buscar la información

  const ProfesorScreen({super.key, required this.profesor});

  @override
  Widget build(BuildContext context) {
    // Escuchamos el provider para obtener el estado del Profesor
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Profesor'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para cargar datos del profesor
            // Mostramos los datos del profesor si están disponibles
            Expanded(
              child: ListView(
                      children: [
                        _buildProfesorInfoCard(
                          icon: Icons.person,
                          title: 'Nombre',
                          subtitle: profesor.name,
                        ),
                        const SizedBox(height: 10),
                        _buildProfesorInfoCard(
                          icon: Icons.work,
                          title: 'Cargo',
                          subtitle: profesor.cargo,
                        ),
                        const SizedBox(height: 10),
                        _buildProfesorInfoCard(
                          icon: Icons.account_balance,
                          title: 'Departamento',
                          subtitle: profesor.departamento,
                        ),
                        const SizedBox(height: 10),
                        _buildProfesorInfoCard(
                          icon: Icons.phone,
                          title: 'Teléfono',
                          subtitle: profesor.telefono,
                        ),
                        const SizedBox(height: 10),
                        _buildProfesorInfoCard(
                          icon: Icons.email,
                          title: 'Correo Electrónico',
                          subtitle: profesor.correo,
                        ),
                        const SizedBox(height: 10),
                        _buildProfesorInfoCard(
                          icon: Icons.assignment_ind,
                          title: 'CURP',
                          subtitle: profesor.curp,
                        ),
                      ],
                    )
                  
            ),
          ],
        ),
      ),
    );
  }

  /// Widget reutilizable para las tarjetas de información del profesor
  Widget _buildProfesorInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
