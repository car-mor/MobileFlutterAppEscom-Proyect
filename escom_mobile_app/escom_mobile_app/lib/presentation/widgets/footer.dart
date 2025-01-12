import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  final String imagePathTop;
  final String imagePathBottom;

  const FooterWidget({
    required this.imagePathTop,
    required this.imagePathBottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const footerColor = Color.fromARGB(255, 51, 51, 51); // RGB 23/27/30

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Primera fila
        Container(
          color: footerColor,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(imagePathTop, height: 80), // Imagen superior
              const SizedBox(height: 10),
              _buildLink('www.gob.mx/SEP/\n', 'https://www.gob.mx/sep'),
              const SizedBox(height: 20),
              const Text(
                'INSTITUTO POLITÉCNICO NACIONAL\n'
                'D.R. Instituto Politécnico Nacional (IPN). Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México 2009-2013.\n\n'
                'Esta página es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito de la Dirección General del Instituto.',
                textAlign: TextAlign.center,
                
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),

        // Segunda fila
        Container(
          color: const Color.fromARGB(255, 0, 47, 42),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(imagePathBottom, height: 60), // Imagen inferior
              const SizedBox(height: 10),
              const Text(
                'Enlaces',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
                _buildLink('Participa', 'https://participa.gob.mx/'),
                _buildLink('Publicaciones Oficiales', 'https://www.gob.mx/publicaciones'),
                _buildLink('Marco Jurídico', 'http://www.ordenjuridico.gob.mx/'),
                _buildLink('Plataforma Nacional de Transparencia Alerta Denuncia', 
                          'https://consultapublicamx.inai.org.mx/vut-web/'),
                const SizedBox(height: 10),
                const Text(
                '¿Qué es gob.mx?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
                _buildBodyText(
                    'Es el portal único de trámites, información y participación ciudadana Leer más'),
                const SizedBox(height: 10),
                _buildLink('Portal de datos abiertos', 'https://datos.gob.mx/'),
                _buildLink('Declaración de accesibilidad', 'https://www.gob.mx/privacidadintegral'),
                _buildLink('Aviso de privacidad simplificado', 
                          'https://www.gob.mx/privacidadsimplificado'),
                _buildLink('Términos y condiciones', 'https://www.gob.mx/terminos'),
                _buildLink('Política de seguridad', 'https://www.gob.mx/terminos#medidas-seguridad-informacion'),
                _buildLink('Mapa de sitio', 'https://www.gob.mx/sitemap'),
                const SizedBox(height: 20),
                _buildLink('Denuncia contra servidores públicos', 'https://www.gob.mx/tramites/ficha/presentacion-de-quejas-y-denuncias-en-la-sfp/SFP54'),
                const SizedBox(height: 10),
                _buildSectionTitle('Síguenos en:'),
                const SizedBox(height: 10),
             //Iconos de redes sociales 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
              onPressed: () => _launchURL('https://www.facebook.com/gobmexico'),
              icon: const Icon(Icons.facebook, color: Colors.white),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => _launchURL('https://twitter.com/GobiernoMX'),
              icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
            ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

  /// Widget para crear un enlace de texto
  Widget _buildLink(String text, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 250, 250, 250),
            fontSize: 13,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  /// Widget para un título
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Widget para texto informativo
  Widget _buildBodyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Función para abrir una URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }

