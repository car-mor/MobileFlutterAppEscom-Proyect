import 'package:escom_mobile_app/config/router/app_router.dart';
// import 'package:escom_mobile_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
      theme: appTheme.getTheme(),
    );
  }
}
