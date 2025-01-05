import '../entities/auth_user_model.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> register({
    required String identifier,
    required String password,
    required TipoUsuario tipoUsuario,
    required Map<String, dynamic> userData,
  });

  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  });

  Future<Map<String, dynamic>> checkAuthStatus(String token);
}