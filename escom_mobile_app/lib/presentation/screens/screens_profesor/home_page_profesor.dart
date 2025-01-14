import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:escom_mobile_app/presentation/screens/teacher_screen.dart';
import 'package:escom_mobile_app/presentation/widgets/header.dart';
import 'package:escom_mobile_app/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomePageProfesor extends ConsumerStatefulWidget {
  static const String name = 'home_page_profesor';

  final Map<String, dynamic> profesorData;

  const HomePageProfesor({super.key, required this.profesorData});

  @override
  HomePageProfesorState createState() => HomePageProfesorState();
}

class HomePageProfesorState extends ConsumerState<HomePageProfesor> {
  late final Profesor profesor;
  bool isLoggedIn = true;
  bool isStudent = false;
  bool isTeacher = true;
  String? teacherName;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print("Datos recibidos en HomePageProfesor: ${widget.profesorData}");
    profesor = Profesor(
      name: widget.profesorData['profesor_nombre'] ?? '',
      cargo: widget.profesorData['cargo'] ?? '',
      departamento: widget.profesorData['departamento'] ?? '',
      telefono: widget.profesorData['telefono'] ?? '',
      correo: widget.profesorData['correo'] ?? '',
      curp: widget.profesorData['curp'] ?? '',
    );
    print("Profesor object creado: $profesor");
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final name = prefs.getString('name');
    final role = prefs.getString('role'); // Supongamos que guardamos "student" o "teacher"

    setState(() {
      isLoggedIn = email != null;
      isStudent = role == 'student';
      isTeacher = role == 'teacher';
      teacherName = name;
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
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final greetingMessage = _getGreetingMessage();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 8),
            child: GestureDetector(
              onTap: () async {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfesorScreen(profesor: profesor),
                    ),
                  );
                }
              },
              child: const ProfileAvatar(
                imageUrl: null, // Pasa la URL aquí si está disponible
                size: 40,
              ),
            ),
          ),
        ],
      ),
      drawer: SideMenu(
        scaffoldKey: _scaffoldKey,
      ),
      body: isLoggedIn && isTeacher
          ? SingleChildScrollView(
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
                      _getGreetingMessage() + ' ${profesor.name ?? 'Profesor'}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Bienvenido(a) a la Aplicación Informativa de nuestra escuela. Aquí encontrarás toda la información que necesitas como profesor.',
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
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'No se pudo cargar la información del profesor',
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}
