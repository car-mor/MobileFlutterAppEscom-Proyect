import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatar extends ConsumerWidget {
  final String? imageUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 40.0, // Tamaño predeterminado
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    // Calcular el color del fondo según el tema
    final backgroundColor = isDarkMode
        ? const Color.fromARGB(255, 78, 78, 78)
        : Colors.grey[200];

    // Calcular el color del ícono según el tema
    final iconColor = isDarkMode ? Colors.grey[200] : const Color(0xFF006699); // Azul #006699

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor, // Color de fondo predeterminado
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _fallbackIcon(iconColor!),
              ),
            )
          : _fallbackIcon(iconColor!),
    );
  }

  Widget _fallbackIcon(Color iconColor) {
    return Center(
      child: FaIcon(
        FontAwesomeIcons.user,
        color: iconColor, // Usar el color calculado para el icono
        size: 24,
      ),
    );
  }
}
