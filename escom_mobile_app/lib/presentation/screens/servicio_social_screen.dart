import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicioSocialScreen extends ConsumerWidget {
  static const String name = 'servicio_social_screen';
  const ServicioSocialScreen({super.key});

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
                                'Servicio Social',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Es un requisito indispensable para el proceso de titulación profesional. Se cubre al realizar actividades relacionadas con los conocimientos adquiridos en las aulas, talleres y laboratorios, por lo tanto, se considera como una retribución que hace el egresado a la sociedad que le dio la oportunidad de obtener una profesión. Los requisitos (tomados del Reglamento de Servicio Social del IPN) para prestar el Servicio Social dentro del Instituto Politécnico Nacional se enumeran a continuación:',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Artículo 7. Por sus funciones y fines académicos, el servicio social estará desvinculado de cualquier relación de carácter laboral y no podrá otorgar categoría de trabajador al prestador bajo ninguna circunstancia, con excepción de lo señalado en el artículo 20 del presente:',
                        textAlign: TextAlign.justify,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.aplicaciones.abogadogeneral.ipn.mx/PDFS/Normatividad/carpeta4/GAC_EXT_932B_reglamento_serv_social.pdf'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Reglamento', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Artículo 11. El servicio deberá prestarse dentro de los programas que al efecto se convengan con los sectores público, social y privado, así como los que establezca el propio instituto. \n'
                        'Artículo 13. El servicio que se realice en programas intrainstitucionales será gratuito. \n'
                        'Artículo 14. El servicio deberá prestarse durante un periodo mínimo de seis meses y máximo de dos años, quedando determinado el mismo por las características del programa al que este adscrito el prestador y su duración no podrá ser menor de cuatrocientas ochenta horas. La prestación será continua a efecto de que pueda cumplir sus objetivos. \n'
                        'Artículo 15. El servicio que realicen los prestadores nacionales o extranjeros de los planteles deberá realizarse en el territorio de la República Mexicana, en beneficio de la sociedad y el estado mexicano. \n'
                        ,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Requisitos',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 16),
                      const Text(
                        'Para iniciar tu registro tienes que darte de alta en el Sistema Institucional de Servicio Social del IPN:',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => _launchURL('https://serviciosocial.ipn.mx/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('SISS', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TitulosHeader(
                        titulo: 'Documentos',
                        tamanoTitulo: 18,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                      onTap: () => _launchURL('https://forms.office.com/r/7dXtF7j1Fb'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Solicitud de Constancia de SS',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/apoyoseducativos/docs/Formato_Reporte_Mensual.docx'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Reporte mensual',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/apoyoseducativos/docs/Formato_Reporte_Global.docx'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Reporte global',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/apoyoseducativos/docs/Reporte_de_Desempeno_o_Evaluacion.docx'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Reporte de desempeño (o evaluación)',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/apoyoseducativos/docs/Procedimiento_para_la_liberacion_del_servicio_social.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Procedimiento de liberación de servicio social',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/apoyoseducativos/docs/Procedimiento_de_baja_de_servicio_social.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Procedimiento de baja de servicio social',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                                'Calendario de Sesiones Informativas',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 16),
                      Image.asset(
                        'assets/images/serviciosocial.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Preguntas Frecuentes',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 16),
                      ExpandableContentSection(
                            title: '¿Quién puede realizar el Servicio Social?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Los alumnos inscritos que tengan el 70% de los créditos aprobados. Los egresados que cuenten con el 100% de créditos aprobados. O en su defecto mediante un DICTAMEN, siempre y cuando cumplas con los siguientes requisitos:'),
                              ContentItem(content: '-Cuentes con el 60% de créditos o más'),
                              ContentItem(content: '-Con el primer y segundo nivel concluido'),
                              ContentItem(content: '-Ser regular'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Cuándo puedo iniciar mi Servicio Social?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'El perido de servicio social es cada 1 y 16 de cada mes, o en su caso de ser día inhábil (fin de semana o día festivo), la fecha posterior más próxima.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Dónde puedo consultar las fechas de inicio de Servicio Social?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Hemos creado un calendario y este lo puedes encontrar dentro o fuera de la oficina de Servicio Social o la página de Facebook, en el podrás determinar tu fecha de inicio y termino en caso de que quieras realizar tu servicio dentro o fuera del I.P.N. además de la fecha límite de entrega de documentación.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿En dónde puedo realizar mi Servicio Social?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Seas BECARIO o NO el servicio social podrás realizarlo en cualquier Dependencia de Gobierno(Federal, Estatal o Municipal), Asociación Civil, Escuelas o Centros de Investigación del I.P.N u otras instituciones educativas que cuenten con convenio.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Cómo sé si una dependencia tiene convenio con el IPN?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Esta información sólo puedes consultarla en el lugar dónde quieres realizar el servicio social o buscar en un navegador: SISS IPN y entra a VACANTES y ahí encontraras todas las dependencias que tienen convenio con el IPN.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Si no cuanto con el 70% de créditos y quiero iniciar el Servicio Social qué hago?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Debes cumplir con 3 requisitos:'),
                              ContentItem(content: '-Ser regular (no adeudar materias)'),
                              ContentItem(content: '-Tener el 60% o más de créditos'),
                              ContentItem(content: '-Tener completo el 1er y 2do nivel del prográma académico'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Qué papeles debo entregar para que me hagan mi dictamen?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: '-Escrito dirigio a la comisión de Servicio Social, en donde expongas el motivo por el cual deseas iniciar el servicio, debe llevar los datos completos del alumno y su firma, entregar copia y original'),
                              ContentItem(content: '-Copia de la constancia de créditos*'),
                              ContentItem(content: '-Boleta de calificaciones*\n'),
                              ContentItem(content: '* La boleta y constancia se tramitan en Gestión Escolar'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Cómo se llena el reporte mensual?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Revisa el video: https://youtu.be/hpbppIpr1bY'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Quién debe firmar mis reportes mensuales?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Recuerda que tu responsable directo es quien debe firmar tus reportes mensuales.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Qué es un responsable directo?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Es la persona con la que trabajas directamente, la que te indica que hacer y revisa tu trabajo.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Hay un número máximo o mínimo de horas que se deben reportar?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'No existe un námero mínimo de horas totales por mes, pero si un máximo, no debes exceder las 88 horas por mes. SOLO PUEDES REPORTAR 4 HORAS DIARIAS.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Si quiero dar de BAJA el Servicio Socual, qué hago?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Entra a tu sesión del SISS y solicita tu baja en el sistema, después deberás realizar un escrito libre dirigido a la Comisión de Servicio Social, donde expongas los motivos por los cuales te dáras de baja , incluiras tus datos personales y boleta y deberás firmarla. Entrega dicho escrito en la oficina de Servicio Social en original y copia.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: 'Si ya terminé mi Servicio Social ¿Qué debo hacer?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Debes dirigirte a la oficina para consultar los requisitos y descargar los formatos de termino de servicio.'),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '¿Después de iniciado el trámite de liberación, cuánto tiempo dura el proceso para la expedición de mi carta?',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Después de entregar documentación y cubrir los requisitos solicitados en la oficina de S.S. la expedición de tu constancia de liberación tardará de 3 a 6 meses, en cuanto se expida enviaremos un correo a tu e-mail registrado en la carta compromiso para que acudas por ella o también se publicara la lista en el Facebook de Servicio Social.'),
                            ],
                        ),
                    const SizedBox(height: 16),
                    const Text(
                                'Informes:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const TitulosHeader(
                        titulo: 'Lic. Heydi Medrano Ber',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('5557296000 Ext. 52056'),
                        ],
                      ),
                      const SizedBox(height: 8), 
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.envelope, size: 16),
                            SizedBox(width: 8),
                            Text('servicio_social_escom@ipn.mx'),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.facebook, size: 16),
                            SizedBox(width: 8),
                            Text('ssescom'),
                          ],
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

