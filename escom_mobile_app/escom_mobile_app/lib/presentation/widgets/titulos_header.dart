import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitulosHeader extends ConsumerWidget {
  final String? titulo;
  final String? subtitulo;
  final bool tituloNegrita;
  final bool subtituloNegrita;
  final double tamanoTitulo;
  final double tamanoSubtitulo;
  final bool tieneFondo;
  final double? lineaHeight;
  final bool tieneLineaIzquierda; // Nueva propiedad para controlar la línea
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? child;

  const TitulosHeader({
    super.key,
    this.titulo,
    this.subtitulo,
    this.child,
    this.tituloNegrita = true,
    this.subtituloNegrita = false,
    this.tamanoTitulo = 24,
    this.tamanoSubtitulo = 16,
    this.tieneFondo = false,
    this.tieneLineaIzquierda = false, // Por defecto, sin línea
    this.lineaHeight,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    final Color fondoColor = tieneFondo
        ? (isDarkMode
            ? const Color.fromARGB(255, 51, 51, 51)
            : const Color.fromARGB(22, 81, 81, 81))
        : Colors.transparent;

    final Color textoColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      width: double.infinity,
      color: fondoColor,
      padding: (titulo != null && subtitulo != null) ? const EdgeInsets.symmetric(vertical: 16.0) : const EdgeInsets.symmetric(vertical: 0.0), // Relleno superior e inferior
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tieneLineaIzquierda) // Mostrar línea solo si tieneLineaIzquierda es true
            Container(
              width: 4,
              height: lineaHeight ?? (titulo != null ? null : 100),
              color: const Color.fromARGB(255, 222, 222, 224),
            ),
          if (tieneLineaIzquierda)
            const SizedBox(width: 8), // Espaciado entre la línea y el texto
          Expanded(
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: [
                if (titulo != null)
                  Text(
                    titulo!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: tamanoTitulo,
                      fontWeight: tituloNegrita ? FontWeight.bold : FontWeight.normal,
                      color: textoColor,
                    ),
                  ),
                  if (child != null) ...[
                const SizedBox(height: 8), // Espaciado entre subtitulo y el child
                child!,
              ],
                if (titulo != null && subtitulo != null)
                  const SizedBox(height: 8),
                if (subtitulo != null)
                  Text(
                    subtitulo!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: tamanoSubtitulo,
                      fontWeight: subtituloNegrita ? FontWeight.bold : FontWeight.normal,
                      color: textoColor,
                    ),
                  ),
                  
              ],
            ),
          ),
        ],
      ),
    );
  }
}
