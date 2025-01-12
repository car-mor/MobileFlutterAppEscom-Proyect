import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EleccionTernasScreen extends ConsumerWidget {
  
  static const String name = 'eleccion_ternas_screen';
  const EleccionTernasScreen({super.key});

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
                      const TitulosHeader(
                        titulo: 'Procesos para la designación de Director/Subdirectores de la ESCOM',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXX - CTCE',
                        subtitle: 'Dirección',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/direccion2024.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXVIII - CTCE',
                        subtitle: 'Subdirección\nAdministrativa',
                        appointmentDate: '16 de junio de 2023',
                        personName: 'M. en E. Elia Tzindejhé Ramírez Martínez',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subAdm2023.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXVII - CTCE',
                        subtitle: 'Subdirección de Servicios Educativos e Integración Social',
                        appointmentDate: '7 de febrero de 2023',
                        personName: 'M. en C. José Asunción Enríquez Zárate',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subSEIS2022.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'Colegio de Profesores',
                        subtitle: 'Sección de Estudios de Posgrado e Investigación',
                        appointmentDate: '20 de febrero de 2023',
                        personName: 'M. en D.E. Miguel Ángel Rodríguez Castillo',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/sepi2022.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXVII - CTCE',
                        subtitle: 'Subdirección Académica',
                        appointmentDate: '12 de abril de 2022',
                        personName: 'M. en C. Iván Giovanny Mosso García',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subAcad2022.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXV - CTCE',
                        subtitle: 'Dirección',
                        appointmentDate: '28 de agosto de 2020',
                        personName: 'M. en C. Andrés Ortigoza Campos',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/direccion2020.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'Colegio de Posgrado',
                        subtitle: 'Sección de Estudios de Posgrado e Investigación',
                        appointmentDate: '1 de febrero de 2019',
                        personName: 'Dr. Tonáhtiu Arturo Ramírez Romero',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/sepi2018.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXIV - CTCE',
                        subtitle: 'Subdirección Administrativa',
                        appointmentDate: '17 de diciembre de 2018',
                        personName: 'Ing. Felipe de Jesús Figueroa Del Prado',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subAdm2018.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXIII - CTCE',
                        subtitle: 'Subdirección de Servicios Educativos e Integración Social',
                        appointmentDate: '1 de agosto de 2018',
                        personName: 'M. en C. José Asunción Enríquez Zárate',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subSEIS2018.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXII - CTCE',
                        subtitle: 'Subdirección Académca',
                        appointmentDate: '15 - Mar - 2017',
                        personName: 'M. en C. Iván Giovanny Mosso García',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subAcad2017.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXI - CTCE',
                        subtitle: 'Dirección',
                        appointmentDate: '7 - Nov - 2016',
                        personName: 'Lic. Andrés Ortigoza Campos',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/direccion2016.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XXI - CTCE',
                        subtitle: 'Subdirección de Servicios Educativos e Integración Social',
                        appointmentDate: '6 - Jun - 2016',
                        personName: 'M.en C. Idalia Maldonado Castillo',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subSEIS2016.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'XX - CTCE',
                        subtitle: 'Subdirección Administrativa',
                        appointmentDate: '3 - Nov - 2015',
                        personName: 'Ing. Felipe de Jesús Figueroa Del Prado',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/subAdm2015.html');
                        },
                      ),
                      const SizedBox(height: 20),
                      ProcessCard(
                        title: 'Colegio de Posgrado',
                        subtitle: 'Sección de Estudios de Posgrado e Investigación',
                        appointmentDate: '30 - Oct - 2015',
                        personName: 'Dra. Blanca Esther Carvajal Gámez',
                        onTapProcess: () {
                          _launchURL('https://www.escom.ipn.mx/ternas/sepi.html');
                        },
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