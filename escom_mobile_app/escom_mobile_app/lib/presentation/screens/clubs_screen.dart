import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubsScreen extends ConsumerWidget{

  static const String name = 'clubs_screen';

  const ClubsScreen({super.key});

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
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        );

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
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 14),
                        child: TitulosHeader(
                          titulo: "CLUBS",
                          subtitulo: "Estudiantes/Clubs",
                          tituloNegrita: true,
                          subtituloNegrita: false,
                          tamanoTitulo: 28,
                          tamanoSubtitulo: 18,
                          tieneFondo: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Grupos de Aprendizaje fuera del aula; son un conjunto de actividades extracurriculares donde un grupo de estudiantes con intereses comunes sobre alguna temática en particular, se reunen para investigar, aprender, copmprender, practicar y aplicar los conceptos de ésta; ya sea para fines "recreativos" o de "competencia".',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const TitulosHeader(
                        titulo: 'Club de Mini-Robótica',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinadora: M. en C. María del Rosario Rocha Bernabé.\n'
                        'Punto de reunión: Planta baja, edificio de laboratorios (junto a los laboratorios de electrónica analógica).\n'
                        'Contacto: rosario.rocha@gmail.com',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.facebook.com/CMR.ESCOM/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('FB/CMR.ESCOM/', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Club de Algoritmia (ACM Student Chapter)',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinador: M. en C. Edgardo Adrián Franco Martínez\n'
                        'Contacto: edfranco@ipn.mx',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.facebook.com/algoritmiaescom/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('FB/algoritmiaescom', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Club de Bio-Robótica',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinadora: M. en C. Gabriela de Jesús López Ruíz\n'
                        'Contacto: bioroboticaescom@gmail.com',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('http://www.comunidad.escom.ipn.mx/biorobotica/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('www.comunidad.escom.ipn.mx/biorobotica/', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Developer Student Club ESCOM-IPN',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinadora: M. en C. Axel Ernesto Moreno Cervantes\n'
                        'Contacto: amorenoc@ipn.mx',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://gdsc.community.dev/national-polytechnic-institute-of-mexico-escom/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('DSC - ESCOM', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Club de Seguridad y Hacking Ético',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinadora: M. en C. Gilberto Sánchez Quintanilla\n'
                        'Contacto: mcsquintanillag@yahoo.com.mx',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.facebook.com/CSI.ESCOM.oficial'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('FB/CSI.ESCOM.oficial', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Club de Ciencia Datos',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Coordinadora: Dra. Miriam Pescador Rojas / Dr. Roberto Zagal Flores\n'
                        'Laboratorio de Ciencia de Datos 1. Lun, Mie y Jue de 13:30 a 15 horas\n'
                        'Contacto: mpescadorr@ipn.mx ',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.instagram.com/weare_tukey'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('INST/weare_tukey', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
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