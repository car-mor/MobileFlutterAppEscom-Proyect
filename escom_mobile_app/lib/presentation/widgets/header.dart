import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onToggleTheme; // Acción al presionar el botón
  final bool isDarkMode; // Para mostrar el ícono adecuado

  const HeaderWidget({
    required this.imagePath,
    required this.onToggleTheme,
    required this.isDarkMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: screenWidth,
          height: screenWidth * 0.14, // Proporción de 2:1 (ancho:alto)
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 8, // Separación del borde inferior
          right: 8, // Separación del borde derecho
          child: IconButton(
            icon: Icon(
              isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
              color: Colors.white, // Asegúrate de que sea visible sobre la imagen
            ),
            onPressed: onToggleTheme,
          ),
        ),
      ],
    );
  }
}
