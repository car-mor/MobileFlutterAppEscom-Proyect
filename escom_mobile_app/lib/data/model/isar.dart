import 'package:isar/isar.dart';

part 'isar.g.dart';

// Quitamos @collection del enum
enum TipoUsuario {
  alumno,
  profesor
}

@collection
class Usuario {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String identifier;
  
  late String password;

  @enumerated
  late TipoUsuario tipoUsuario;
  
  final alumno = IsarLink<Alumno>();
  final profesor = IsarLink<Profesor>();
}

@collection
class Alumno {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late int boleta;
  
  late String nombre;
  late String curp;
  late String carrera;
  String? telefono;
  
  @Index(unique: true)
  String? correo;
  
  @Backlink(to: 'alumno')
  final usuario = IsarLink<Usuario>();
}

@collection
class Profesor {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String curp;
  
  late String nombre;
  String? cargo;
  String? departamento;
  String? telefono;
  
  @Index(unique: true)
  String? correo;
  
  @Backlink(to: 'profesor')
  final usuario = IsarLink<Usuario>();
}

@collection
class Horario {
  Id id = Isar.autoIncrement;
  late int boleta;
  late String curpProfesor;
  late int idGrupo;

  final grupo = IsarLink<Grupo>();
  final profesor = IsarLink<Profesor>();
  final alumno = IsarLink<Alumno>();
}

@collection
class Grupo {
  Id id = Isar.autoIncrement;
  late String grupo;
  late String carrera;
  late String dia;
  late DateTime horaInicio;
  late DateTime horaTermino;

  final horarios = IsarLinks<Horario>();
}