import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CulturalActivitiesScreen extends ConsumerWidget  {

  static const String name = 'cultural_activities_screen';

  const CulturalActivitiesScreen({super.key});

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
                      const SizedBox(height: 20),
                      const Text(
                                'Actividades Culturales',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'La ESCOM cuenta con los siguientes talleres culturales:',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/cultural_activities/arts.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'ARTES PLÁSTICAS:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      Text(
                        'Aprende a expresar tus emociones y sentimientos por medio de la pintura y el dibujo.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Profra. Martha Aurora Torres Hernández.\n'
                        'Horario: Miércoles y Viernes de 13:00 a 18:00 h.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/cultural_activities/literary.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'CREACIÓN LITERARIA:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      Text(
                        'Podrás adquirir técnicas y métodos para formar hábitos de lectura y escritura. Además prepara a los alumnos para participar en concursos de poesía, cuento, lectura en atril y declamación.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Prof. Julián Castruita Morán\n'
                        'Horario: Jueves de 11:00 a 16:00 h.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/cultural_activities/theater.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'TEATRO:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      Text(
                        'Aprende a expresarte en público a través de diversas técnicas teatrales, contribuyendo así a un mejor desarrollo integral.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Profra. Verónica Hernández\n'
                        'Horario:Mártes de 12:00 a 15:00 h & Miércoles de 15:30 a 18:30 h.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/cultural_activities/other.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'CLUBES CULTURALES:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      ...[
                        ' Impro',
                        'Tuna ESCOM (Este club se divide en: femenil y varonil)',
                        'Algoritmo de baile (Salsa y Bachata)',
                        'Anime',
                      ].map((miembros) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.circle, size: 8),
                                const SizedBox(width: 8),
                                Flexible(  // Flexible también se puede usar para asegurar que el texto se ajuste
                                  child: Text(
                                    miembros,
                                    style: textStyle,
                                    softWrap: true,  // Permite que el texto se divida en múltiples líneas
                                    overflow: TextOverflow.visible,  // Evita el recorte del texto
                                  ),
                                ),
                              ],
                            ),
                          )),
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
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.phone, size: 16),
                          const SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52063', style: textStyle),
                        ],
                      ),
                      const SizedBox(height: 8), 
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.envelope, size: 16),
                            const SizedBox(width: 8),
                            Text('cultura_y_deportes_escom@ipn.mx', style: textStyle),
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