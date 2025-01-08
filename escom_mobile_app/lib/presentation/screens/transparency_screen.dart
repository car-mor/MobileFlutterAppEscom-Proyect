import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class TransparencyScreen extends StatefulWidget {
  static const String name = 'transparency_screen';
  const TransparencyScreen({super.key});
  @override
  State<TransparencyScreen> createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOM-MOBILE'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ProfileAvatar(
              imageUrl: null, // Pasa la URL aquí si está disponible
              size: 60,
            ),
          ),
        ],
      ),
      body: const _TransparencyView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),

    );
  }
}

class _TransparencyView extends ConsumerWidget {
  const _TransparencyView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    final iconColor = isDarkMode ? Colors.white : const Color.fromARGB(255, 0, 102, 153);
    final textColor = isDarkMode ? Colors.white : const Color.fromARGB(255, 0, 102, 153);


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderWidget(
              imagePath: './../../../assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme,
              isDarkMode: isDarkMode),


          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 14),
            child: TitulosHeader(
                  titulo: "Transparencia",
                  subtitulo: "Conócenos",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                  tieneFondo: true,
                ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(8),

            child: Padding (
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  const TitulosHeader(
                  titulo: "CVs Funcionarios",
                  tituloNegrita: true,
                  tamanoTitulo: 20,
                  tieneFondo: false,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Primer bloque
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV20_01_AOC.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. Andrés Ortigoza Campos",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV20_07_IGMG.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. Iván Giovanny Mosso García",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV21_10_ETRM.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en E. Elia Tzindejhé Ramírez Martínez",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV20_05_JAEZ.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. José Asunción Enríquez Zárate",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV21_19_MARC.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. Miguel Ángel Rodríguez Castillo",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],                                            
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV20_02_LLX.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en P. Laura Lazcano Xoxotla",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV24_RAAP.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en D.T.I. Ricardo Ángel Aguilar Pérez",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 48),



                         //Segundo bloque
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV2024_PJMC.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. Paola Judith Maldonado Colín",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.go('/transparency_screen');
                                },
                                //Este funcionario no tiene CV en la página oficial de ESCOM
                                child: Text(
                                  "M. en T.A.E. Mayra Esperanza Hernández Contreras",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV21_20_EFF.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "Ing. Erick Fernández Franco",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV2024_PMG.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "C.P. Patricia Mata Gil",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  context.go('/transparency_screen');
                                },
                                //Este funcionario no tiene CV en la página oficial de ESCOM
                                child: Text(
                                  "C. Daniela López Vega",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],                                            
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV2024_AOT.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "C. Álvaro Olvera Toral",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  //En página oficial de escom no se tiene ningún CV de este funcionario
                                  final Uri url = Uri.parse('');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "Lic. Gerardo Elías Rodríguez Jaramillo",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 48),


                         // Tercer bloque
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV2024_MRGC.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M . en A.P. María del Rosario Galeana Chávez",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV20_18_JFSG.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "Lic. José Francisco Serrano García",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  context.go('/transparency_screen');
                                },
                                //Este funcionario no tiene CV en la página oficial de ESCOM
                                child: Text(
                                  "Lic. Norma Olalde Mogollán",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  //En página oficial de escom no se tiene ningún CV de este funcionario
                                  final Uri url = Uri.parse('');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "Dra. Claudia Celia Díaz Huerta",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV21_12_DGHD.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "Lic. Diana Gabriela Horcasitas Domínguez",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],                                            
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                            const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  //En página oficial de escom no se tiene ningún CV de este funcionario
                                  final Uri url = Uri.parse('');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en A. de N. María Magdalena Saldívar Almorejo",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: iconColor),
                           const SizedBox(width: 8),
                            FaIcon(FontAwesomeIcons.addressCard, size: 20, color: iconColor),
                            const SizedBox(width: 6),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://www.escom.ipn.mx/docs/transparencia/cvs/CV24_EMG.pdf');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  "M. en C. Elizabeth Moreno Galván",
                                  style: TextStyle(fontSize: 16, color: textColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                
                
                
              )
            ),         
            
          ),


          const FooterWidget(
                        imagePathTop: 'assets/images/logoSEP.png',
                        imagePathBottom: 'assets/images/logoGOB.png',
                      ),
          ]
        ),
      ),
    );
  }
}


