import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/helpers/dio_helper.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String name = '/login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // Icon Banner
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final imageWidth = constraints.maxWidth * 0.4;
                        return Image.asset(
                          'assets/images/escudoESCOM.png',
                          width: imageWidth,
                          fit: BoxFit.fitWidth,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: size.height - 260,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                        ),
                      ),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  final ApiService _apiService = ApiService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void onFormSubmit(WidgetRef ref) async {
    if (formKey.currentState?.validate() ?? false) {
      showSnackbar(context, 'Iniciando sesión...');

      final boleta = emailController.text.trim();
      final contrasena = passwordController.text.trim();

      
        final response = await _apiService.autentificacion(boleta, contrasena);
        var tipoUsuario;

        for (var item in response) {
          if (item is Map<String, dynamic>) {
            tipoUsuario = item['tipoUsuario'];
          }
        }

        if (tipoUsuario == "alumno") {
          ref.read(userProvider.notifier).logInAsStudent(); // Cambiar estado
          showSnackbar(context, 'Inicio de sesión como alumno exitoso');
          GoRouter.of(context).go('/home_page_alumno'); // Redirigir al home
        } else if (tipoUsuario == "profesor") { 
          ref.read(userProvider.notifier).logInAsTeacher(); // Cambiar estado
          showSnackbar(context, 'Inicio de sesión como docente exitoso');
          GoRouter.of(context).go('/home_page_profesor'); // Redirigir al home
        } 
      
    } else {
      showSnackbar(context, 'Por favor, revisa los campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text('Iniciar sesión', style: textStyles.titleLarge),
            const SizedBox(height: 40),
            CustomTextFormField(
              label: 'Boleta',
              controller: emailController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La boleta es requerida';
                }
                if (value.length < 4) {
                  return 'Boleta inválida';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Contraseña',
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña es requerida';
                }
                if (value.length < 4) {
                  return 'La contraseña debe tener al menos 4 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Ingresar',
                buttonColor: const Color.fromARGB(255, 0, 102, 153),
                onPressed: ()=> onFormSubmit(ref),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}