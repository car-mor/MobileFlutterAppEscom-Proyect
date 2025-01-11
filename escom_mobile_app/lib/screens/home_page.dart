import 'package:flutter/material.dart';
import 'login_page.dart';
import 'timetable_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  static const String name = 'home_page'; 
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  String? studentName;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final name = prefs.getString('name');

    setState(() {
      isLoggedIn = email != null;
      studentName = name;
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('name');

    setState(() {
      isLoggedIn = false;
      studentName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            if (!isLoggedIn) ...[
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Ver Carreras'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Información de la Escuela'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Inicio de Sesión'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
              ),
            ] else ...[
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Ver Grupos'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Ver Horarios'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetablePage()),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Buscar Profesor'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar Sesión'),
                onTap: () {
                  _logout();
                  Navigator.pop(context);
                },
              ),
            ],
          ],
        ),
      ),
      body: isLoggedIn
          ? Center(
              child: Text(
                'Bienvenido, $studentName',
                style: const TextStyle(fontSize: 20),
              ),
            )
          : const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Bienvenido a la Aplicación Informativa de nuestra escuela. Aquí encontrarás toda la información que necesitas.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 200, child: Placeholder()), // Widget del mapa
                ],
              ),
            ),
    );
  }
}
