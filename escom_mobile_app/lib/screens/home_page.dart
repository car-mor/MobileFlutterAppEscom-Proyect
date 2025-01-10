import 'package:flutter/material.dart';
import 'login_page.dart';
import 'timetable_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
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
      appBar: AppBar(title: Text('Inicio')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Ver Carreras'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Información de la Escuela'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Inicio de Sesión'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
              ),
            ] else ...[
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Ver Grupos'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Ver Horarios'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetablePage()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Buscar Profesor'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar Sesión'),
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
                style: TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
