import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:escom_mobile_app/presentation/screens/teacher_screen.dart';
import 'package:escom_mobile_app/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomePageProfesor extends ConsumerStatefulWidget {
  static const String name = 'home_page_profesor';
  const HomePageProfesor({super.key});

  @override
  HomePageProfesorState createState() => HomePageProfesorState();
}

class HomePageProfesorState extends ConsumerState<HomePageProfesor> {
  bool isLoggedIn = true;
  bool isStudent = true;
  bool isTeacher = false;
  String? studentName;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final name = prefs.getString('name');
    final role = prefs
        .getString('role'); // Supongamos que guardamos "student" o "teacher"

    setState(() {
      isLoggedIn = email != null;
      isStudent = role == 'student';
      isTeacher = role == 'teacher';
      studentName = name;
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      isLoggedIn = true;
      studentName = 'Carlos';
      isStudent = true;
      isTeacher = false;
    });
  }

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 0 && hour < 6) {
      return 'Buenas madrugadas,';
    } else if (hour >= 6 && hour < 12) {
      return 'Buenos días,';
    } else if (hour >= 12 && hour < 18) {
      return 'Buenas tardes,';
    } else {
      return 'Buenas noches,';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final themeNotifier = ref.read(themeProvider.notifier);
    final greetingMessage = _getGreetingMessage();

    return Scaffold(
      key: _scaffoldKey, // Usamos _scaffoldKey para el Drawer
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 8),
            child: Icon(Icons.account_circle, size: 40),
          ),
        ],
      ),
      drawer: SideMenu(
          scaffoldKey: _scaffoldKey), // Pasamos _scaffoldKey al SideMenu
      body: isLoggedIn
          ? Center(
              child: Text(
                'Bienvenido, $studentName',
                style: const TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    imagePath: 'assets/images/header.png',
                    onToggleTheme: themeNotifier.toggleTheme, // Pasa la función
                    isDarkMode: isDarkMode, // Pasa el estado
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '$greetingMessage${studentName != null ? ', $studentName' : ''}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Bienvenido(a) a la Aplicación Informativa de nuestra escuela. Aquí encontrarás toda la información que necesitas sobre tu semestre.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/aviso_saes.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/dae_saes.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            final teacherData =
                                await fetchTeacherData(); // Llama a la función para obtener los datos del profesor
                            ref
                                .read(userProvider.notifier)
                                .logInAsTeacher(); // Actualiza el estado como profesor

                            // Navega a la pantalla del profesor con los datos
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TeacherScreen(teacher: teacherData),
                                ),
                              );
                            }
                          },
                          child: const Text("Simular como Profesor"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(userProvider.notifier)
                                .logOut(); // Simula inicio de sesión como profesor
                          },
                          child: const Text("Cerrar sesión"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
