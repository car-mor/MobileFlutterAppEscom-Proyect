import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Swiper1 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/sliders/home_screen/slider_1/aviso_privacidad.png',
      'title': 'Aviso de privacidad',
      'subtitle': 'ESCOM',
      'url': 'https://www.ipn.mx/assets/files/proteccion-datos/docs/AP-S-I/NS/API-ESCOM.pdf',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_1/transparencia.png',
      'title': 'Transparencia ESCOM',
      'subtitle': 'Portal de obligaciones de transparencia',
      'url': 'https://www.escom.ipn.mx/htmls/conocenos/transparencia.php',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_1/impunidad.png',
      'title': 'Trabajamos contra la inmunidad',
      'subtitle': 'Ley General de Responsabilidades Administrativas',
      'url': 'https://www.escom.ipn.mx/docs/news/evitaFaltasAdms_2024.pdf',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_1/recsDigs.png',
      'title': 'Recursos Didácticos Digitales',
      'subtitle': 'Ing. en Sistemas Computacionales (2009)',
      'url': 'https://www.escom.ipn.mx/htmls/oferta/matDidacticoISC2009.php',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Swiper(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () async {
              _launchURL(item['url']!); // Llamar a la función para abrir el enlace
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item['image']!, height: 150, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Text(
                    item['title']!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(item['subtitle']!),
                ],
              ),
            ),
          );
        },
        autoplay: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).primaryColor,
            color: Colors.grey,
          ),
        ),
        control: SwiperControl(),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }
}
