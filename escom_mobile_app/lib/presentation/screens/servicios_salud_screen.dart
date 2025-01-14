import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiciosSaludScreen extends ConsumerWidget {
  static const String name = 'servicios_salud_screen';
  const ServiciosSaludScreen({super.key});

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
                                'Sección de Atención a la Salud',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Área de Servicio Médico',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/medicina_n.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'El área médica se ubica en la planta baja del Edificio de Gobierno, a un costado de Gestión Escolar. Brinda atención de primer contacto, es decir, una primera consulta en caso de sentir alguna molestia o síntoma que pueda estar relacionada con alguna enfermedad. En caso de requerir atención de los servicios de medicina del deporte, rehabilitación o nutrición, se puede acudir a la Unidad de Servicios Integrales de Salud Escolar Zacatenco.',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Para atención especializada (cirugía general, ginecología y urgencias) hacer válido el seguro facultativo (IMSS).',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/cartelServicioMedico.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          '¿Qué te ofrece el Servicio Médico?',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/protocoloUsoAmbulancia.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Conoce el protocolo para el Uso de la Ambulancia',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/tripticoUsoAmbulancia.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Tríptico para el Uso de la Ambulancia',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/seguroVida.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Seguro de Vida',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/ejemploLlenadoSeguroVida.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Ejemplo de llenado de Seguro de Vida',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/seguroAccidentes.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Seguro de Accidentes',
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
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/ejemploLlenadoSeguroAccidentes.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 20,  // Puedes ajustar el tamaño de la imagen
                          height: 20, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Ejemplo de llenado de Seguro de Accidentes',
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
                        onTap: () => _launchURL('https://docs.google.com/forms/d/e/1FAIpQLSesltmSfnHYW-K4Yj5sLYJOfmjwweCHHLAJAJjX7bsvU86AKQ/viewform'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('->Formulario para Seguro de Vida y Seguro de Accidentes', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Matutino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Dra. Aideé Lizbeth Galván Zermeño\nDr. Daniel Mauricio Temozihui Trejo',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52014'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a Viernes de 8:00 a 15:00 h.'),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Vespetino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Dr. Óscar Cortés Jiménez\nDr. Cuauhtémoc García Hidalgo',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52014'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a Viernes de 16:00 a 22:00 h.'),
                          ],
                        ),
                        const Text(
                                'Odontología',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/tooth.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'El Servicio Odontológico trabaja con el compromiso de fomentar y preservar tu salud bucal, a través de servicios con cuotas de recuperación asequibles. Se ubica en la planta baja del Edificio de Gobierno, a un costado de Gestión Escolar.',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Matutino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'C. D. Rocío Gómez Ruíz',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52079'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a viernes de 8:00 a 15:00 h.'),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Vespetino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'C. D. Gabriela Sanabria Paredes',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52079'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a viernes de 15:00 a 21:00 h.'),
                          ],
                        ),

                        const Text(
                                'Orientación Educativa',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/orientacion.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tiene el propósito de crear y fomentar en el estudiante politécnico una cultura de salud mental para contribuir a la generación de conocimientos, conductas y actitudes de responsabilidad y autocuidado que se proyecten en una mejor calidad de vida y apoyar a la comunidad estudiantil en su desempeño académico, desarrollo humano e integración social.\n\nSi requieres orientación acerca de problemas de índole: personal, de pareja, autoestima, familiar, rendimiento escolar, o si decides resolver dudas acerca de: adicciones, sexualidad, relaciones humanas, hábitos de estudio.\n\nEl Servicio de Orientación Juvenil te atenderá de manera GRATUITA y totalmente CONFIDENCIAL.',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Matutino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Lic. Paola Celeste Montes de Oca Gómez',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52080'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a viernes de 08:00 a 15:00 h.'),
                          ],
                        ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.envelope, size: 16),
                            SizedBox(width: 8),
                            Text('pmontesdeocag@ipn.mx'),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const Text(
                                'Responsables Turno Vespetino',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Lic. Estefania Castro Burgos',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),

                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 57296000 Ext. 52080'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.clock, size: 16),
                            SizedBox(width: 8),
                            Text('Lunes a viernes de 15:00 a 21:00 h.'),
                          ],
                        ),
                      const SizedBox(height: 8),
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.envelope, size: 16),
                            SizedBox(width: 8),
                            Text('lcastrob@ipn.mx'),
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
