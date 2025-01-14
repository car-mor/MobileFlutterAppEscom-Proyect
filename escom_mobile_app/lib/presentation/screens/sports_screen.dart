import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SportsScreen extends ConsumerWidget {
  static const String name = 'sports_screen';
  const SportsScreen({super.key});

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
                                'Actividades Deportivas',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Fomentar la participación de los estudiantes en actividades deportivas que colaboren en su desarrollo académico e intelectual. La ESCOM participa activamente en diferentes actividades a través de selecciones y equipos representativos en torneos internos y juegos deportivos interpolitécnicos.',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 25),
                      Image.asset(
                        'assets/images/football.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'FÚTBOL: SOCCER, SIETE Y RÁPIDO (VARONIL / FEMENIL)',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Prof. Diego Espinosa Gómez.\n'
                        'Horario: Martes de 16:00 a 19:00 h. / Miércoles de 10:00 a 18:00 h. / Viernes de 12:00 a 20:00 h.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/voleyball.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Voleibol (Varonil / Femenil)',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Prof. Hugo Hernández Vera.\n'
                        'Horario: Martes y Jueves de 12:00 a 19:00 h.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/clubes.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Clubes Deportivos (Varonil / Femenil):',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Taekwondo\n'
                        'Ajedrez\n'
                        'Barras\n'
                        'Basquetbol\n'
                        'Ping Pong\n'
                        'Tochito Bandera\n',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Informes:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                        const TitulosHeader(
                        titulo: 'Lic. Álvaro Olvera Toral',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.phone, size: 16),
                          const SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52063')
                        ],
                      ),
                      const SizedBox(height: 8), 
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.envelope, size: 16),
                            const SizedBox(width: 8),
                            Text('cultura_y_deportes_escom@ipn.mx'),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Text(
                                'Documentos:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 20),
                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/SSEIS_ProcedimientoClubes_2022.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 50,  // Puedes ajustar el tamaño de la imagen
                          height: 50, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Procedimiento de registro y gestión de un Club Académico, Cultural o Deportivo',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/FormatoSolicitudMateriales.xlsx'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/sobresalir.png',  // Ruta de tu imagen
                            width: 50,  // Puedes ajustar el tamaño de la imagen
                          height: 50, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Formato para Solicitud de material de un Club Académico, Cultural o Deportivo',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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

