import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:card_swiper/card_swiper.dart';

class GenericCardSwiper extends StatelessWidget {
  final List<Map<String, String>> items;
  final double height;

  const GenericCardSwiper({
    super.key,
    required this.items,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Swiper(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () async {
              await _launchURL(item['url']!); // Llamar a la función para abrir el enlace
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
