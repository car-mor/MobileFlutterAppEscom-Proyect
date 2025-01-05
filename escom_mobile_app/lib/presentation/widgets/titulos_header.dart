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
  final bool tieneFondo; // Parámetro que indica si tiene fondo específico

  const TitulosHeader({
    super.key,
    this.titulo, // Ahora es opcional
    this.subtitulo, // También opcional
    this.tituloNegrita = true,
    this.subtituloNegrita = false,
    this.tamanoTitulo = 24,
    this.tamanoSubtitulo = 16,
    this.tieneFondo = false, // Por defecto no tiene fondo
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el valor de isDarkMode desde el proveedor de Riverpod
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    // Color de fondo dependiendo del estado de isDarkMode y tieneFondo
    final Color fondoColor = tieneFondo
    ? (isDarkMode ? const Color.fromARGB(255, 134, 134, 134) : const Color.fromARGB(22, 81, 81, 81)) // Fondo gris cuando tieneFondo es true
    : Colors.transparent; // Fondo transparente cuando tieneFondo es false
 
    //Color del texto dependiendo el tema
    final Color textoColor = isDarkMode ? Colors.white : Colors.black; // Color del texto según el tema



    return Container(
      width: double.infinity, // Hace que abarque todo el ancho disponible
      color: fondoColor, // El fondo depende de tieneFondo y el tema
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Relleno superior e inferior
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (titulo != null) // Muestra solo si 'titulo' no es nulo
            Text(
              titulo!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: tamanoTitulo,
                fontWeight: tituloNegrita ? FontWeight.bold : FontWeight.normal,
                color: textoColor, // Color del texto según el tema
              ),
            ),
          if (titulo != null && subtitulo != null)
            const SizedBox(height: 8), // Espaciado solo si ambos están presentes
          if (subtitulo != null) // Muestra solo si 'subtitulo' no es nulo
            Text(
              subtitulo!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: tamanoSubtitulo,
                fontWeight: subtituloNegrita ? FontWeight.bold : FontWeight.normal,
                color: textoColor, // Color del texto según el tema
              ),
            ),
        ],
      ),
    );
  }
}
