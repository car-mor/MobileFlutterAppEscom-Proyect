import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: '',
      description: '',
      imageUrl: 'assets/images/bienvenida_ESCOM_MOBILE_1.png'),
  SlideInfo(
      title:
          'Explora nuestras carreras y planes de estudio. ¡Conoce a los profesores que te guiarán hacia el éxito!',
      description: '',
      imageUrl: 'assets/images/bienvenida_ESCOM_MOBILE_2.png'),
  SlideInfo(
      title:
          'Tu gestión académica, más simple que nunca. Vive tu experiencia en ESCOM con más facilidad.',
      description: '',
      imageUrl: 'assets/images/bienvenida_ESCOM_MOBILE_3.png'),
  SlideInfo(
      title:
          'Transformando el futuro de la computación, un estudiante a la vez.',
      description: '',
      imageUrl: 'assets/images/bienvenida_ESCOM_MOBILE_4.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  //late final pageviewController = PageController();
  //Para ahorrarse el late
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      //print('page: ${pageviewController.page}');
      // if (pageviewController.page == slides.length - 1) {
      //   context.go('/home_screen');
      // }
      final page = pageviewController.page ?? 0;
      if ( !endReached && page >= (slides.length - 1.5) ) {
        setState(() {
          endReached = true;
        });
      }

    });
  }

@override //Para liberar recursos de listeners
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [


          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    description: slideData.description,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),

           Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Saltar'),
              onPressed: () {
                GoRouter.of(context).go('/home_screen');
              },
            ),
          ),


          endReached ?  Positioned(
              bottom: 40,
              right: 30,
              child: FadeInRight( //animacion de entrada de animate_do
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                   onPressed: () {
                      GoRouter.of(context).go('/login_screen'); // Redirige a la ruta especificada
                    },
                  child: const Text('Comenzar'),
                            ),
              ),
            ) : const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
    final descriptiontyle = Theme.of(context).textTheme.bodyMedium;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.center, // Asegúrate de que el texto esté centrado
        ),
            const SizedBox(height: 20),
            Text(description, style: descriptiontyle,),
          ],
        ),
      ),
    );
  }
}
