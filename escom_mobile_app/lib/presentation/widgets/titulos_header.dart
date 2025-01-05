import 'package:flutter/material.dart';

class TitulosHeader extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final bool tituloNegrita;
  final bool subtituloNegrita;
  final double tamanoTitulo;
  final double tamanoSubtitulo;

  const TitulosHeader({
    // Key? key,
    super.key,
    required this.titulo,
    required this.subtitulo,
    this.tituloNegrita = true,
    this.subtituloNegrita = false,
    this.tamanoTitulo = 24,
    this.tamanoSubtitulo = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: tamanoTitulo,
            fontWeight: tituloNegrita ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8), // Espaciado entre el título y el subtítulo
        Text(
          subtitulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: tamanoSubtitulo,
            fontWeight: subtituloNegrita ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
