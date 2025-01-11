import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/config/router/app_router.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeProvider);
    final userState = ref.watch(userProvider); // Observamos el estado de usuario

    // Determinamos la ruta inicial en función del estado de autenticación
    if (userState.isLoggedIn) {
      if (userState.isStudent) {
        try {
          GoRouter.of(context).go('/home_page_alumno');
        }
        catch (e) {
          debugPrint('Error al navegar a /home_page_alumno: $e');
        }
      } else if (userState.isTeacher) {
        try {
          GoRouter.of(context).go('/home_page_profesor');
        }
        catch (e) {
          debugPrint('Error al navegar a /home_page_profesor: $e');
        }
      }
    } else {
      try {
          GoRouter.of(context).go('/home_screen');
      }
      catch (e) {
          debugPrint('Error al navegar a /home_screen: $e');
      }
    }

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, // Configuración del router
      title: 'ESCOM App',
      theme: appTheme.getTheme(),
    );
  }
}