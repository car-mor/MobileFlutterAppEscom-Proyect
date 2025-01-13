import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:escom_mobile_app/presentation/screens/student_screen.dart';
import 'package:escom_mobile_app/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomePageAlumno extends ConsumerStatefulWidget {
  static const String name = 'home_page_alumno';

  final Map<String, dynamic>  studentData; // Ajusta el tipo según tus datos, por ejemplo, Map<String, dynamic>
  
  const HomePageAlumno({super.key, required this.studentData});

  @override
  HomePageAlumnoState createState() => HomePageAlumnoState();
}

class HomePageAlumnoState extends ConsumerState<HomePageAlumno> {
  late final Student student;
  bool isLoggedIn = true;
  bool isStudent = true;
  bool isTeacher = false;
  String? studentName;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
void initState() {
  super.initState();
  print("Datos recibidos en HomePageAlumno: ${widget.studentData}");
  student = Student(
    name: widget.studentData['alumno_nombre'] ?? '',
    carrera: widget.studentData['carrera'] ?? '',
    telefono: widget.studentData['telefono'] ?? '',
    correo: widget.studentData['correo'] ?? '',
    curp: widget.studentData['curp'] ?? '',
  );
  print("Student object creado: $student");
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
      studentName = name;
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
    final greetingMessage = _getGreetingMessage();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 8),
            child: GestureDetector(
              onTap:  () async {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentScreen(student: student),
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
      drawer: SideMenu(scaffoldKey: _scaffoldKey),
      body: isLoggedIn && isStudent
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                  _getGreetingMessage() + ' ${student.name ?? 'Estudiante'}',
  style: Theme.of(context).textTheme.headlineSmall,
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
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     ref
                        //         .read(userProvider.notifier)
                        //         .logInAsStudent(); // Actualiza el estado como estudiante

                        //     final studentData =
                        //         await fetchStudentData(); // Llama a la función para obtener los datos del estudiante

                        //     // Navega a la pantalla del estudiante con los datos
                        //     if (context.mounted) {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               StudentScreen(student: studentData),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   child: const Text("Simular como Alumno"),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'No se pudo cargar la información del estudiante',
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}