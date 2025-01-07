import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/helpers/dio_helper.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String name = '/login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

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
                        final imageWidth = constraints.maxWidth * 0.4; // La mitad del ancho de la pantalla
                        return Image.asset(
                          'assets/images/escudoESCOM.png',
                          width: imageWidth,
                          fit: BoxFit.fitWidth, // Ajusta el alto proporcionalmente
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: size.height - 260, // 80 los dos sizebox y 100 el ícono
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100)),
                      ),
                      child: const _LoginForm(),
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final ApiService _apiService = ApiService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onFormSubmit() async {
   /* if (formKey.currentState?.validate() ?? false) {
      // Mostrar un loading mientras hacemos la solicitud
      showSnackbar(context, 'Iniciando sesión...');

      final curp = emailController.text.trim();
      final boleta = passwordController.text.trim();

      try {
        // Llamada al backend para autenticar al usuario
        final response = await authenticateUser(curp, boleta);

        if (!mounted) return;  // Asegúrate de que el widget esté montado

        if (response['token'] != null) {
          // Si la respuesta contiene un token, guardar el token
          final token = response['token'];
          saveToken(token);

          // Navegar a la siguiente pantalla, por ejemplo, el home
          context.push('/home');
        } else {
          showSnackbar(context, response['message'] ?? 'Error desconocido');
        }
      } catch (error) {
        if (!mounted) return;  // Asegúrate de que el widget esté montado
        showSnackbar(context, 'Ocurrió un error: $error');
      }
    } else {
      showSnackbar(context, 'Por favor, revisa los campos');
    }*/
    final response = await _apiService.sendData();
    print(response);
    
    
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
              controller: emailController, // Activar el controlador
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La boleta es requerido';
                }
                if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                  return 'Boleta invalida';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Contraseña',
              controller: passwordController, // Activar el controlador
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La contraseña es requerida';
                }
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
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
                onPressed: onFormSubmit,
              ),
            ),
            const Spacer(flex: 2),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () => context.push('/register_screen'),
                  child: const Text('Crea una aquí'),
                ),
              ],
            ),
            const Spacer(flex: 1),*/
          ],
        ),
      ),
    );
  }
}

