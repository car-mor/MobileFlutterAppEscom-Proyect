import 'package:escom_mobile_app/domain/repositories/auth_repository.dart';
import 'package:escom_mobile_app/presentation/providers/auth_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../domain/entities/auth_user_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository: authRepository, localStorage: prefs);
});

// Provider para SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final AuthUser? user;
  final String? errorMessage;

  AuthState({
    this.isAuthenticated = false,
    this.token,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
    AuthUser? user,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final SharedPreferences localStorage;

  AuthNotifier({
    required this.authRepository,
    required this.localStorage,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> register({
    required String identifier,
    required String password,
    required TipoUsuario tipoUsuario,
    required Map<String, dynamic> userData,
  }) async {
    try {
      final response = await authRepository.register(
        identifier: identifier,
        password: password,
        tipoUsuario: tipoUsuario,
        userData: userData,
      );
      
      final user = AuthUser.fromJson(response['user']);
      await _saveToLocalStorage(response['token'], user);
      
      state = state.copyWith(
        isAuthenticated: true,
        token: response['token'],
        user: user,
      );
    } catch (e) {
      _clearAuthState();
      throw Exception(e.toString());
    }
  }

  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await authRepository.login(
        identifier: identifier,
        password: password,
      );
      
      final user = AuthUser.fromJson(response['user']);
      await _saveToLocalStorage(response['token'], user);
      
      state = state.copyWith(
        isAuthenticated: true,
        token: response['token'],
        user: user,
      );
    } catch (e) {
      _clearAuthState();
      throw Exception(e.toString());
    }
  }

  Future<void> checkAuthStatus() async {
    final token = localStorage.getString('token');
    final userStr = localStorage.getString('user');
    
    if (token == null || userStr == null) {
      _clearAuthState();
      return;
    }

    try {
      final response = await authRepository.checkAuthStatus(token);
      final user = AuthUser.fromJson(response['user']);
      
      state = state.copyWith(
        isAuthenticated: true,
        token: token,
        user: user,
      );
    } catch (e) {
      logout();
    }
  }

  Future<void> logout() async {
    await localStorage.remove('token');
    await localStorage.remove('user');
    _clearAuthState();
  }

  Future<void> _saveToLocalStorage(String token, AuthUser user) async {
    await localStorage.setString('token', token);
    await localStorage.setString('user', jsonEncode(user.toJson()));
  }

  void _clearAuthState() {
    state = AuthState();
  }
}