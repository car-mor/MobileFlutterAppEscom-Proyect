import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Swiper2 extends StatelessWidget {
  final List<Map<String, String>> items = [
   {
      'image': 'assets/images/sliders/home_screen/slider_2/actViolencia.png',
      'title': 'Protocolo de Atención ante un Acto de Violencia',
      'subtitle': 'en Contra de un Miembro de la Comunidad Politécnica.',
      'url': 'https://tinyurl.com/3d9bjcx7',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_2/psicologos.png',
      'title': 'Centro de Atención y Prevención Psicológica',
      'subtitle': 'atencionpsicologica@ipn.mx / 55 5729 6000 ext. 63425',
      'url': 'https://www.virtual.cics-sto.ipn.mx/sicappsi/',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_2/linea_guinda.png',
      'title': 'Línea Guinda',
      'subtitle': 'Si experimentas violencia de género. 55 5729 6000 Ext. 63425',
      'url': 'https://www.ipn.mx/genero/',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_2/codigoConducta.png',
      'title': 'Código de Conducta',
      'subtitle': 'para personas servidoras públicas del IPN',
      'url': 'https://tinyurl.com/277ucy89',
    },
    {
      'image': 'assets/images/sliders/home_screen/slider_2/defensoriaDerechosPolitecnicos.png',
      'title': 'Defensoria Derechos Politécnicos',
      'subtitle': 'Órgano autónomo que actuará con independencia de las autoridades del mismo',
      'url': 'https://www.ipn.mx/defensoria/',
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
              await _launchURL(item['url']!); // Llamar a la función para abrir el enlace
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
