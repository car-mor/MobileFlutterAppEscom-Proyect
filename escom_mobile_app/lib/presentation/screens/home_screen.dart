import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen'; 

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOM-MOBILE'),
         actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ProfileAvatar(
              imageUrl: null, // Pasa la URL aquí si está disponible
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              imagePath: 'assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme, // Pasa la función
              isDarkMode: isDarkMode, // Pasa el estado
            ),
            const CustomSlider(), // Aquí se muestra el custom_slider
            const SizedBox(height: 20),
            //Imágenes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Primera imagen
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/cecescom.png', // Reemplaza con la ruta de tu imagen.
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Línea gris
                const VerticalDivider(
                    width: 1, // Espacio ocupado por el divisor.
                    thickness: 1, // Grosor de la línea gris.
                    color: Colors.grey, // Color de la línea.
                  ),
                // Segunda imagen
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/celexescom.png', // Reemplaza con la ruta de tu imagen.
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Texto
             Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Text(
                  'Redes Sociales',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => _launchURL('https://www.facebook.com/escomipnmx/'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.facebook, size: 30),
                      SizedBox(width: 5),
                      Text('/escomipnmx'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () => _launchURL('http://www.twitter.com/escomunidad/'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.twitter, size: 30),
                      SizedBox(width: 5),
                      Text('@escomunidad'),
                    ],
                  ),
                ),
              ],
            ),
          ),

            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      Text('Agenda', 
                      style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                  ),),
                      SizedBox(width: 5),
                      FaIcon(FontAwesomeIcons.book, size: 30),
              ]
           ),
            const SizedBox(height: 20),
            Swiper1(),
            const SizedBox(height: 20),
            Swiper2(),
            const SizedBox(height: 20),

           
            const FooterWidget(
              imagePathTop: 'assets/images/logoSEP.png',
              imagePathBottom: 'assets/images/logoGOB.png',
            ),
          ],
        ),
      ),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}


Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch URL: $url';
  }
}


