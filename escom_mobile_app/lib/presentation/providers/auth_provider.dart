import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState {
  final bool isLoggedIn;
  final bool isStudent;
  final bool isTeacher;

  UserState({
    required this.isLoggedIn,
    required this.isStudent,
    required this.isTeacher,
  });

  UserState copyWith({
    bool? isLoggedIn,
    bool? isStudent,
    bool? isTeacher,
  }) {
    return UserState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isStudent: isStudent ?? this.isStudent,
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }

  factory UserState.initial() {
    return UserState(
      isLoggedIn: false,
      isStudent: false,
      isTeacher: false,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState.initial()) {
    _loadLoginState(); // Cargar el estado al iniciar
  }

  void logInAsStudent() {
    state = state.copyWith(isLoggedIn: true, isStudent: true, isTeacher: false);
    _saveLoginState();
  }

  void logInAsTeacher() {
    state = state.copyWith(isLoggedIn: true, isStudent: false, isTeacher: true);
    _saveLoginState();
  }

  void logOut() {
    state = state.copyWith(isLoggedIn: false, isStudent: false, isTeacher: false);
    _saveLoginState();
  }

  Future<void> _saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", state.isLoggedIn);
    await prefs.setBool("isStudent", state.isStudent);
    await prefs.setBool("isTeacher", state.isTeacher);
  }

  Future<void> _loadLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    final isStudent = prefs.getBool("isStudent") ?? false;
    final isTeacher = prefs.getBool("isTeacher") ?? false;

    state = UserState(
      isLoggedIn: isLoggedIn,
      isStudent: isStudent,
      isTeacher: isTeacher,
    );
  }
  Future<void> performLogout() async {
    // Limpiar SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Actualizar estado
    state = UserState.initial();
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier());
