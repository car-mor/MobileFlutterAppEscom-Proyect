import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DenunciationsScreen extends ConsumerWidget {

  static const String name = 'denunciations_screen';

  const DenunciationsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch URL: $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    /*final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        );*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOM-MOBILE'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ProfileAvatar(
              imageUrl: null,
              size: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  imagePath: 'assets/images/header.png',
                  onToggleTheme: themeNotifier.toggleTheme,
                  isDarkMode: isDarkMode,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: 

                  Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                                'Buzón de Atención a Casos de Violencia',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      // Aquí agregamos la imagen como link
                      InkWell(
                        onTap: () => _launchURL(
                          'https://www.gob.mx/sesnsp/acciones-y-programas/buzon-de-atencion-a-casos-de-violencia-contra-las-mujeres'),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0), // Ajusta el radio de las esquinas
                          child: Image.asset(
                            'assets/images/denuncias/b-denuncia.png',
                            width: 350, // Ancho de la imagen
                            height: 350, // Alto de la imagen
                          ),
                      ),
                      ),
                    ],
                  ),
                ),
                const FooterWidget(
                  imagePathTop: 'assets/images/logoSEP.png',
                  imagePathBottom: 'assets/images/logoGOB.png',
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );


    
  }
}