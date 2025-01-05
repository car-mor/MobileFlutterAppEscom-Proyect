import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 40.0, // Tamaño predeterminado
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200], // Color de fondo predeterminado
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _fallbackIcon(),
              ),
            )
          : _fallbackIcon(),
    );
  }

  Widget _fallbackIcon() {
    return const Center(
      child: FaIcon(
        FontAwesomeIcons.user,
        color: Color(0xFF006699), // Azul #006699
        size: 24,
      ),
    );
  }
}
