import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = '/login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: LayoutBuilder(builder: (context, constraints) {
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
                    height:
                        size.height - 260, // 80 los dos sizebox y 100 el ícono
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
          }),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    void onFormSubmit() {
      if (formKey.currentState?.validate() ?? false) {
        // Lógica de autenticación aquí
        showSnackbar(context, 'Formulario enviado correctamente');
      } else {
        showSnackbar(context, 'Por favor, revisa los campos');
      }
    }

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
              label: 'CURP',
              keyboardType: TextInputType.emailAddress,
              //controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El CURP es requerido';
                }
                if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'CURP no válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Boleta',
              obscureText: true,
              //controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La boleta es requerida';
                }
                if (value.length < 6) {
                  return 'La boleta debe tener al menos 6 caracteres';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () => context.push('/register_screen'),
                  child: const Text('Crea una aquí'),
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
