import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para el título
final tituloProvider = StateProvider<String>((ref) => "Galería de toma de protesta");

// Provider para el subtítulo
final subtituloProvider = StateProvider<String>((ref) => "Egresados");