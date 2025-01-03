import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/config/theme/app_theme.dart'; // Asegúrate de importar tu AppTheme

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleTheme() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);
