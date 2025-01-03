import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = '/register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon Banner
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          
                          children: [
                            const SizedBox(height: 90),
                            IconButton(
                              onPressed: () {
                                if (!context.canPop()) return;
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                              ),
                            ),
                            child: const _RegisterForm(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 20),
            Text('Crear cuenta', style: textStyles.titleLarge),
            const SizedBox(height: 20),
          const CustomTextFormField(
            label: 'Nombre completo',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'CURP',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Repita la contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Crear',
              buttonColor: const Color.fromARGB(255, 0, 102, 153),
              onPressed: () {},
            ),
          ),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    return context.pop();
                  }
                  context.go('/login');
                },
                child: const Text('Ingresa aquí'),
              ),
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}