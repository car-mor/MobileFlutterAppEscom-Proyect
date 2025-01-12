import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final selectedSectionProvider = StateProvider<String>((ref) => 'becas');

class BecasScreen extends ConsumerWidget {
  static const String name = 'becas_screen';

  const BecasScreen({super.key});

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

    final selectedSection = ref.watch(selectedSectionProvider);

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
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                                'Becas y otros apoyos',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Objetivo',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 8),
                      Text(
                        'Fijar estímulos dirigidos a la comunidad estudiantil, por medio de apoyos que contribuyan a reducir la deserción escolar y el incremento de la eficiencia terminal, para lograr la excelencia académica. En ESCOM puedes tener acceso a una gran variedad de becas, para ser acreedor de alguna de ellas debes estar atento a las convocatorias que se publican, donde encontrarás los procedimientos y documentos requeridos.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Procedimiento para solicitar una beca',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          _buildSectionButton(
                            ref: ref,
                            icon: Icons.public,
                            text: 'Publicación de Convocatoria',
                            section: 'convocatorias',
                            textStyle: textStyle,
                          ),
                          const SizedBox(height: 16),
                          _buildSectionButton(
                            ref: ref,
                            icon: Icons.person_add,
                            text: 'Inscribirse al Sistema de Becas',
                            section: 'inscripcion',
                            textStyle: textStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSelectedSection(
                        selectedSection: selectedSection,
                        textStyle: textStyle,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                                'Tipos de Becas',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 16),
                      ...[
                        'Institucional',
                        'Transporte Institucional',
                        'Excelencia IPN',
                        'Excelencia Telmex-Telcel',
                        'Cultural',
                        'Deportiva',
                        'Para la aprobación',
                      ].map((beca) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.circle, size: 8),
                                const SizedBox(width: 8),
                                Text(beca, style: textStyle),
                              ],
                            ),
                          )),
                      const SizedBox(height: 16),
                      Text('Consulta los requisitos de cada beca: ', style: textStyle),
                      InkWell(
                        onTap: () => _launchURL('https://drive.google.com/file/d/1TMYDJFORnzKHXnSi4-Z_xTz5R5bVRptL/view'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Aquí mismo', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                                'Informes',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      const SizedBox(height: 16),
                      const TitulosHeader(
                        titulo: 'Lic. Martha Angélica Gasca Cervantes',
                        tamanoTitulo: 18,
                        tituloNegrita: false,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(FontAwesomeIcons.phone, size: 16),
                          const SizedBox(width: 8),
                          Text('57296000 Ext. 52056', style: textStyle),
                        ],
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => _launchURL('mailto:becas.escom@ipn.mx'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.envelope, size: 16),
                            const SizedBox(width: 8),
                            Text('becas.escom@ipn.mx', style: textStyle),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => _launchURL('https://www.facebook.com/BecasEscom'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.facebook, size: 16),
                            const SizedBox(width: 8),
                            Text('BecasEscom', style: textStyle),
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

  Widget _buildSectionButton({
    required WidgetRef ref,
    required IconData icon,
    required String text,
    required String section,
    required TextStyle? textStyle,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(selectedSectionProvider.notifier).state = section;
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.teal[600]),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  text,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedSection({
    required String selectedSection,
    required TextStyle? textStyle,
  }) {
    if (selectedSection == 'convocatorias') {
      return Column(
        children: [
          const TitulosHeader(
            titulo: 'Convocatorias',
            tamanoTitulo: 20,
            tituloNegrita: true,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 8),
          Text(
            'El Instituto Politécnico Nacional de manera semestral hace del conocimiento público, por medio de los canales oficiales de comunucación, de la(s) convocatoria(s) correspondientes.',
            style: textStyle,
            textAlign: TextAlign.justify,
          ),
        ],
      );
    } else if (selectedSection == 'inscripcion') {
      return Column(
        children: [
          const TitulosHeader(
            titulo: 'Inscripción al Sistema de Becas',
            tamanoTitulo: 20,
            tituloNegrita: true,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 8),
          Text(
            '1. Realizar pre-registro en www.sibec.ipn.mx\n'
            '2. Llenar estudio socioeconómico en las fechas señaladas por la Convocatoria General de Becas del IPN\n'
            '3. Cargar en el sistema SIBEC los documentos requeridos por la propia convocatoria',
            style: textStyle,
            textAlign: TextAlign.justify,
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}