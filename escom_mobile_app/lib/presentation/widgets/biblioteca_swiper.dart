import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CustomSliderBiblioteca extends StatelessWidget {
  const CustomSliderBiblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> slides = [
      'assets/images/biblioteca/slide1.jpg',
      'assets/images/biblioteca/slide2.jpg',
      'assets/images/biblioteca/slide3.jpg',
      'assets/images/biblioteca/slide4.jpg',
      'assets/images/biblioteca/slide5.jpg',
      'assets/images/biblioteca/slide6.jpg',
      'assets/images/biblioteca/slide7.jpg',
      'assets/images/biblioteca/slide8.jpg',
    ];

    return SizedBox(
      height: 200, // Altura del slider
      child: Swiper(
        itemCount: slides.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(slides[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        autoplay: true,
        autoplayDelay: 5000,
        loop: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).primaryColor,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          ),
        ),
        control: SwiperControl(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
