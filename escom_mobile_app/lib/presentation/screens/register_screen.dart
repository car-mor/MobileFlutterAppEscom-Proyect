import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_user_model.dart';
import '../providers/auth_provider.dart';
import '../widgets/widgets.dart';

// Provider para el estado del formulario
final registerFormProvider = StateNotifierProvider<RegisterFormNotifier, RegisterFormState>((ref) {
  return RegisterFormNotifier();
});

final TextEditingController correoController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController curpController = TextEditingController();
final TextEditingController boletaController = TextEditingController();
final TextEditingController carreraController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();


class RegisterFormState {
  final String nombre;
  final String curp;
  final String correo;
  final String password;
  final String confirmPassword;
  final String? boleta;
  final String? carrera;
  final TipoUsuario tipoUsuario;
  final bool isLoading;
  final String? errorMessage;

  RegisterFormState({
    this.nombre = '',
    this.curp = '',
    this.correo = '',
    this.password = '',
    this.confirmPassword = '',
    this.boleta,
    this.carrera,
    this.tipoUsuario = TipoUsuario.alumno,
    this.isLoading = false,
    this.errorMessage,
  });

  RegisterFormState copyWith({
    String? nombre,
    String? curp,
    String? correo,
    String? password,
    String? confirmPassword,
    String? boleta,
    String? carrera,
    TipoUsuario? tipoUsuario,
    bool? isLoading,
    String? errorMessage,
  }) => RegisterFormState(
    nombre: nombre ?? this.nombre,
    curp: curp ?? this.curp,
    correo: correo ?? this.correo,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    boleta: boleta ?? this.boleta,
    carrera: carrera ?? this.carrera,
    tipoUsuario: tipoUsuario ?? this.tipoUsuario,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
  );
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  void onNombreChanged(String value) {
    state = state.copyWith(nombre: value);
  }

  void onCurpChanged(String value) {
    state = state.copyWith(curp: value);
  }

  void onCorreoChanged(String value) {
    state = state.copyWith(correo: value);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value);
  }

  void onConfirmPasswordChanged(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void onBoletaChanged(String value) {
    state = state.copyWith(boleta: value);
  }

  void onCarreraChanged(String value) {
    state = state.copyWith(carrera: value);
  }

  void onTipoUsuarioChanged(TipoUsuario value) {
    state = state.copyWith(tipoUsuario: value);
  }

  void setErrorMessage(String? message) {
    state = state.copyWith(errorMessage: message);
  }
}

class RegisterScreen extends ConsumerWidget {
  static const String name = '/register';

  const RegisterScreen({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerForm = ref.watch(registerFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage != null) {
        showSnackbar(context, next.errorMessage!);
      }

      if (next.isAuthenticated) {
        context.go('/'); // O la ruta que corresponda según el tipo de usuario
      }
    });

    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // Icon Banner
                Row(
                  children: [
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
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: const _RegisterForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerStatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<_RegisterForm> {
  // Define tus controladores aquí dentro de State
  final TextEditingController correoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController curpController = TextEditingController();
  final TextEditingController boletaController = TextEditingController();
  final TextEditingController carreraController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Libera los controladores cuando ya no sean necesarios
    correoController.dispose();
    nombreController.dispose();
    curpController.dispose();
    boletaController.dispose();
    carreraController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = ref.watch(registerFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Crear cuenta', style: textStyles.titleLarge),
          const SizedBox(height: 50),

          // Tipo de usuario
          SegmentedButton<TipoUsuario>( 
            segments: const [
              ButtonSegment(value: TipoUsuario.alumno, label: Text('Alumno')),
              ButtonSegment(value: TipoUsuario.profesor, label: Text('Profesor')),
            ],
            selected: {registerForm.tipoUsuario},
            onSelectionChanged: (Set<TipoUsuario> selected) {
              ref.read(registerFormProvider.notifier).onTipoUsuarioChanged(selected.first);
            },
          ),
          const SizedBox(height: 30),

          CustomTextFormField(
            label: 'Nombre completo',
            controller: nombreController, // Usamos el controller aquí
            onChanged: ref.read(registerFormProvider.notifier).onNombreChanged,
          ),
          const SizedBox(height: 30),

          CustomTextFormField(
            label: 'CURP',
            controller: curpController, // Usamos el controller aquí
            onChanged: ref.read(registerFormProvider.notifier).onCurpChanged,
          ),
          const SizedBox(height: 30),

          if (registerForm.tipoUsuario == TipoUsuario.alumno) ...[
            CustomTextFormField(
              label: 'Boleta',
              controller: boletaController, // Usamos el controller aquí
              onChanged: ref.read(registerFormProvider.notifier).onBoletaChanged,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),

            CustomTextFormField(
              label: 'Carrera',
              controller: carreraController, // Usamos el controller aquí
              onChanged: ref.read(registerFormProvider.notifier).onCarreraChanged,
            ),
            const SizedBox(height: 30),
          ],

          CustomTextFormField(
            label: 'Correo',
            controller: correoController, // Aquí pasas el controlador
            onChanged: ref.read(registerFormProvider.notifier).onCorreoChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El correo no puede estar vacío';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),

          CustomTextFormField(
            label: 'Contraseña',
            controller: passwordController, // Usamos el controller aquí
            onChanged: ref.read(registerFormProvider.notifier).onPasswordChanged,
            obscureText: true,
          ),
          const SizedBox(height: 30),

          CustomTextFormField(
            label: 'Confirmar contraseña',
            controller: confirmPasswordController, // Usamos el controller aquí
            onChanged: ref.read(registerFormProvider.notifier).onConfirmPasswordChanged,
            obscureText: true,
          ),
          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Crear cuenta',
              buttonColor: const Color.fromARGB(255, 0, 102, 153),
              onPressed: () {
                final authNotifier = ref.read(authProvider.notifier);
                final form = ref.read(registerFormProvider);

                if (form.password != form.confirmPassword) {
                  ref.read(registerFormProvider.notifier)
                     .setErrorMessage('Las contraseñas no coinciden');
                  return;
                }

                // Crear el mapa de datos según el tipo de usuario
                Map<String, dynamic> userData = {
                  'nombre': form.nombre,
                  'curp': form.curp,
                  'correo': form.correo,
                };

                if (form.tipoUsuario == TipoUsuario.alumno) {
                  userData.addAll({
                    'boleta': form.boleta,
                    'carrera': form.carrera,
                  });
                }

                authNotifier.register(
                  identifier: form.tipoUsuario == TipoUsuario.alumno 
                    ? form.boleta! 
                    : form.curp,
                  password: form.password,
                  tipoUsuario: form.tipoUsuario,
                  userData: userData,
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Ingresa aquí'),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
