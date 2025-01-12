import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BolsaTrabajoScreen extends ConsumerWidget  {

  static const String name = 'bolsa_trabajo_screen';

  const BolsaTrabajoScreen({super.key});

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
                                'Bolsa de Trabajo',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Es un gusto para nosotros que consideren a la Escuela Superior de Cómputo del Instituto Politécnico Nacional y en especial a sus estudiantes y egresados para integrarlos en su plan de trabajo. Es un compromiso para nosotros ser un vínculo y enlace entre ustedes empresas y nuestra comunidad, por lo mismo les solicitamos de la manera más atenta que, para hacer la publicación de sus vacantes y plazas de trabajo, sigan los siguientes pasos:',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '1.- Registrarse como empresa en el Sistema de Bolsa de Trabajo, el cual es institucional y tiene como principal objetivo llevar un mayor control y constatar la seriedad de su empresa:',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => _launchURL('http://www.bolsadetrabajo.ipn.mx/btrabajo/'), // La URL a la que se redirige
                        child: const Text(
                          'SIBOLTRA',
                        style: TextStyle(
                        color: Color.fromARGB(255, 0, 150, 136),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                      const SizedBox(height: 20),
                      Text(
                        'Al momento de hacer el registro, elegir a la Escuela Superior de Cómputo (ESCOM) como escuela de origen para poderlos gestionar correctamente.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Si ya están registrados, entonces solo es necesario nos indiquen el RFC con el que se dio de alta.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '2.- Llenar el siguiente formulario con los datos de la vacante ofertada:',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => _launchURL('https://forms.gle/2btSeEV2hDBZfuJfA'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Aquí mismo', 
                            style: TextStyle(color: Color.fromARGB(255, 0, 150, 136), fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '3.- Si derivado de este proceso, alguno de nuestros egresados/as o alumnos/as cumple con el perfil y forma parte de su plantilla, le pedimos nos haga llegar los datos de contacto de éstos/as: nombre, puesto y correo electrónico, con la finalidad de saber si en el ámbito laboral nuestra comunidad cumple con los perfiles que requiere el sector empresarial.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Las vacantes se concentran en un boletín semanal que se difunde los miércoles por medio de correo electrónico y nuestras redes sociales, además todas las ofertas que recibimos se encuentran de manera impresa para su consulta en nuestra oficina.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Esperamos cumplir la meta y que tanto egresados como empresas estén satisfechos en el alcance de nuestro objetivo. Quedamos de ustedes para cualquier aclaración o duda.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                                'Informes:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.phone, size: 16),
                          const SizedBox(width: 8),
                          Text('Tel. 5557296000 Ext. 52056', style: textStyle),
                        ],
                      ),
                      const SizedBox(height: 8), 
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.envelope, size: 16),
                            const SizedBox(width: 8),
                            Text('bolsaescom@ipn.mx', style: textStyle),
                          ],
                        ),
                      const SizedBox(height: 8),
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