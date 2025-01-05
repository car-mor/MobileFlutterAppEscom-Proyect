enum TipoUsuario {
  alumno,
  profesor
}

class AuthUser {
  final int id;
  final String identifier;
  final TipoUsuario tipoUsuario;
  final Map<String, dynamic>? userData;

  AuthUser({
    required this.id,
    required this.identifier,
    required this.tipoUsuario,
    this.userData,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'],
      identifier: json['identifier'],
      tipoUsuario: json['tipoUsuario'] == 'alumno' ? TipoUsuario.alumno : TipoUsuario.profesor,
      userData: json['userData'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'identifier': identifier,
    'tipoUsuario': tipoUsuario.toString().split('.').last,
    'userData': userData,
  };
}