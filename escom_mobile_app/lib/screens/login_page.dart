import 'package:escom_mobile_app/presentation/providers/alumno_provider.dart';
import 'package:escom_mobile_app/presentation/screens/screens_alumno/home_page_alumno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/screens/screens_profesor/home_page_profesor.dart';
import 'register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (_emailController.text == storedEmail && _passwordController.text == storedPassword) {
      // Accedemos al studentInfoProvider para obtener los datos del alumno
      final studentData = ref.read(studentInfoProvider);

      // Navegamos a la página de inicio de alumno con la data del alumno
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageAlumno(studentData: {}),
        ),
      );
    } else {
      // Mostrar algún mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context, ref),  // Pasamos context y ref aquí
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              ),
              child: Text('¿No tienes cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}