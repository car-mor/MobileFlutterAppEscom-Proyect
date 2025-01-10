import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class COSIEScreen extends ConsumerWidget {
  static const String name = 'cosie_screen';

  const COSIEScreen({super.key});

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
                                'Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Es el Órgano colegiado que emana de los Consejos Técnicos Consultivos Escolares, del Consejo General Consultivo, o es reconocido por éste y se encarga de dictaminar los asuntos derivados de la situación escolar, en los términos de la normatividad aplicable. (Artículo 3 del RGE).',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Secretario:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const TitulosHeader(
                        titulo: 'M. en C. José Asunción Enríquez Zárate',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.phone, size: 16),
                          const SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52012', style: textStyle),
                        ],
                      ),
                      const SizedBox(height: 8), 
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.envelope, size: 16),
                            const SizedBox(width: 8),
                            Text('sseisescom@ipn.mx', style: textStyle),
                          ],
                        ),
                      
                      const SizedBox(height: 8),
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.clock, size: 16),
                            const SizedBox(width: 8),
                            Text('De 9 a 15 horas', style: textStyle),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Text(
                                'Información:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 20),
                      const Text(
                                '¿Cuál es el objetivo de la COSIE?',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                      const SizedBox(height: 20),
                      Text(
                        'Resolver los recursos de reconsideración presentados por los estudiantes de los niveles medio superior y superior, a través de la emisión del dictamen de situación escolar correspondiente; con el fin de regularizar su trayectoria escolar y recuperar la calidad alumno en el instituto, en apego a la normatividad aplicable.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Fundamentación Legal',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                      const SizedBox(height: 5),
                      const TitulosHeader(
                        titulo: 'Reglamento Interno:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Artículo 196, Fracción I. Define a la Comisión de Situación Escolar como una Comisión Permanente del Consejo General Consultivo.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 5),
                      const TitulosHeader(
                        titulo: 'Reglamento del Consejo General Consultivo:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Artículo 45. Integración de la Comisión de Situación Escolar del Consejo General Consultivo y su Coordinación a cargo de la Secretaría Académica.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 5),
                      const TitulosHeader(
                        titulo: 'Reglamento General de Estudios:',
                        tamanoTitulo: 16,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Artículo 3. La ampliación de tiempo será autorizada únicamente por la Comisión de Situación Escolar del Consejo General Consultivo, a solicitud del alumno y una vez agotado el tiempo máximo de conclusión de sus estudios. \n\n'
                        'Artículo 49. La ampliación de tiempo será autorizada únicamente por la Comisión de Situación Escolar del Consejo General Consultivo, a solicitud del alumno y una vez agotado el tiempo máximo de conclusión de sus estudios. \n\n'
                        'Artículo 52. Fracc. III. Cuando haya agotado el tiempo máximo deberá solicitar a la Comisión de Situación Escolar del Consejo General Consultivo, autorización de reinscripción, así como regularizar sus adeudos y la ampliación de tiempo correspondiente. \n\n'
                        'Artículo 57. Fracc. VI. Baja de la Modalidad. Resolución fundada y motivada de la Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar y del Consejo General Consultivo. \n\n'
                        'Artículo 60. Asuntos no previstos referentes a la situación escolar serán resueltos por la Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar y del Consejo General Consultivo, según corresponda. \n\n'
                        'Artículo 74. Asuntos no previstos referentes a la situación escolar serán resueltos por la Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar y del Consejo General Consultivo, según corresponda. \n\n'
                        'Artículo 75. Lo que debe contener el recurso de reconsideración. \n\n'
                        'Artículo 76. Plazo de 15 días hábiles para emitir el dictamen que resuelva el recurso. \n\n',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const Text(
                                'Miembros:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 10),
                      ...[
                        'Presidente: M. en C. Andrés Ortigoza Campos',
                        'Secretario: M. en C. José Asunción Enríquez Zárate',
                        'M. en C. Iván Giovanny Mosso García',
                        'M. en D. E. Miguel Ángel Rodríguez Castillo',
                        'C. Daniela López Vega (invitada)',
                        'Ing. María del Rosario Galeana Chávez',
                        'Ing. Tania Rodríguez Sarabia',
                        'M. en C. Rocío Palacios Solano',
                        'M. en C. Juan Manuel Carballo Jiménez',
                        'C. Naomi Youshimatz Navarro',
                        'C. Emanuel Said Olarte Rodríguez',
                        'C. Hugo Domínguez Beltrán',
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
                                'Formatos y documentos:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/gestionescolar/documentos/ge_solicitudCOSIE-ESCOM.pdf'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(Icons.circle, size: 8), // Circle as bullet
                            SizedBox(width: 8),
                            Text(
                                'Solicitud para COSIE-CTCE-ESCOM 2025-1', 
                            style: TextStyle(color: Colors.teal, fontSize: 16),
                            
                            ),
                          ],
                          ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/gestionescolar/documentos/CARTA_EXPOSICION_DE_MOTIVO_COSIE_CGC_IPN.docx'),
                      child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                        child: Icon(Icons.circle, size: 8), // Viñeta como círculo negro
                      ),
                      SizedBox(width: 8),
                      Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Carta de Exposición de Motivos COSIE-CGC-ESCOM',
                            style: TextStyle(color: Colors.teal, fontSize: 16),
                            softWrap: true, // Permite que el texto haga un wrap si es largo
                            overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                              ),
                            ), 
                          ],
                        ),
                      ),
                    InkWell(
                    onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/gestionescolar/documentos/CARTA_EXPOSICION_DE_MOTIVO_COSIE_CGC_IPN.docx'),
                    child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                      child: Icon(Icons.circle, size: 8), // Viñeta como círculo negro
                    ),
                    SizedBox(width: 8),
                    Expanded( // Asegura que el texto ocupe el espacio disponible
                    child: Text(
                      'Carta de Exposición de Motivos COSIE-CGC-ESCOM',
                      style: TextStyle(color: Colors.teal, fontSize: 16),
                      softWrap: true, // Permite que el texto haga un wrap si es largo
                      overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                            ),
                          ),
                        ],
                      ),
                    ),

                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/gestionescolar/documentos/SOLICITUD_REINSCRIPCION_CON_MENOS_CREDITOS_25_1.doc'),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Icon(Icons.circle, size: 8), // Viñeta como círculo negro
                            ),
                        SizedBox(width: 8),
                        Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Formato Inscripción con menos Créditos al Periodo Escolar 2025-1',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),

                      InkWell(
                        onTap: () => _launchURL('https://docs.google.com/forms/d/e/1FAIpQLScab--ADi_NGtZf-uAhSEHnjlX9BBhMwvp8nSj2loOLRrlWEQ/closedform'),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                            padding: EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Icon(Icons.circle, size: 8), // Viñeta como círculo negro
                            ),
                          SizedBox(width: 8),
                        Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Solicitud de Dictamen de Inscripción con menos Créditos al Periodo Escolar 2025-1',
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                          softWrap: true, // Permite que el texto haga un wrap si es largo
                          overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                                'Tipo de casos que resuelve el COSIE del Consejo Técnico Consultivo Escolar',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 20),
                  ...[
                        'Que solicitan presentar en Evaluación a Título de Suficiencia, reinscripción o recursamiento al semestre o nivel correspondiente con unidad(es) de aprendizaje desfasada(s), cuando no requieran ampliación de tiempo para la conclusión de su plan de estudios (Art. 52 II y III del RGE).',
                        'Cambio de plan de estudios cuando no requiera ampliación de tiempo.',
                        'Baja del Programa Académico en la Modalidad Educativa, conforme al artículo 57 del Reglamento General de Estudios.',
                        'Autorización de reinscripción a la carga menor a la mínima con adeudos.',
                      ].map((miembros) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 8.0), // Ajusta el espacio vertical de la viñeta
                                    child: Icon(Icons.circle, size: 8), // Viñeta en círculo negro
                                  ),
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
                                'Tipo de casos que resuelve el COSIE del Consejo General Consultivo',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 20),
                  ...[
                        'Que hayan agotado el tiempo para la conclusión de estudios y solicitan la ampliación de tiempo.',
                        'Que cuentan con adeudos desfasados y solicitan presentar en Evaluación a Título de Suficiencia o recursamiento cuando haya agotado el tiempo máximo para la conclusión de sus estudios.',
                        'Cuando el alumno haya incumplido dos dictámenes emitidos por la misma causal de la Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar.',
                        'Para reconocimiento de calificaciones acreditadas de manera extemporánea.',
                        'Para cambio de plan de estudios.',
                        'Autorizar la validación de reinscripción durante el periodo escolar vigente.',
                        'Que causan Baja Definitiva de la Modalidad Educativa.',
                        'Revocación de bajas definitivas emitidas por la Comisión de Situación Escolar del Consejo Técnico Consultivo Escolar, el Titular de la Unidad Académica o de la Comisión de Situación Escolar del Consejo General Consultivo.',
                        'Cuando el resultado de dividir el total de los créditos faltantes para concluir su plan de estudios, entre los periodos escolares disponibles para completarlo, si es mayor a la carga media.',
                      ].map((miembros) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 8.0), // Ajusta el espacio vertical de la viñeta
                                    child: Icon(Icons.circle, size: 8), // Viñeta en círculo negro
                                  ),
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
                      const SizedBox(height: 25),
                      Text('Para más información consulta la página: ', style: textStyle),
                      InkWell(
                        onTap: () => _launchURL('https://www.ipn.mx/des/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('COSIE - CGC', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
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
