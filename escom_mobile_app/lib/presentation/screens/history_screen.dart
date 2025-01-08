import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  static const String name = 'history_screen';
  const HistoryScreen({super.key});
  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
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
              size: 40,
            ),
          ),
        ],
      ),
      body: const _HistoryView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}

class _HistoryView extends ConsumerWidget {
  const _HistoryView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              imagePath: './../../../assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme,
              isDarkMode: isDarkMode,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 14),
              child: TitulosHeader(
                titulo: "Historia & escudo",
                subtitulo: "Conócenos",
                tituloNegrita: true,
                subtituloNegrita: false,
                tamanoTitulo: 28,
                tamanoSubtitulo: 18,
                tieneFondo: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitulosHeader(
                    subtitulo:
                        "Después de varios intentos que se hicieron al respecto, en 1993 un grupo de trabajo integrado por la Secretaría Académica del Instituto, elaboró un proyecto en el que se propuso la creación de la Escuela Superior de Cómputo, bajo la sigla (ESCOM) y al interior de ella la carrera de Ingeniero en Sistemas Computacionales. \n\n Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993.",
                    subtituloNegrita: false,
                    tamanoSubtitulo: 18,
                    tieneFondo: false,
                    tieneLineaIzquierda: true, // Habilitamos la línea gris
                    lineaHeight: 364,
                  ),

                  const TitulosHeader(
                    subtitulo:
                    "Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.",
                    subtituloNegrita: true,
                    tamanoSubtitulo: 18,
                    tieneFondo: false,
                    tieneLineaIzquierda: true, // Habilitamos la línea gris
                    lineaHeight: 160,
                  ),
                                    const SizedBox(height: 10),
                  const TitulosHeader(
                    titulo: "Escudo",
                    tituloNegrita: true,
                    tamanoTitulo: 24,
                    tieneFondo: false,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      'assets/images/escudoESCOM.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TitulosHeader(
                    subtitulo:
                        "En el año de 1994, la dirección del plantel estableció un conjunto de lineamientos que debía cumplir este distintivo y demás identificadores que le sirvieran como imagen oficial. Estos lineamientos fueron:",
                    subtituloNegrita: false,
                    tamanoSubtitulo: 18,
                    tieneFondo: false,
                    tieneLineaIzquierda: true,
                    lineaHeight: 130,
                  ),
                  const SizedBox(height: 10),
                  // Lista de viñetas
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "Trazos claros y sencillos.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "Dar sensación de movimiento.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "No contener elementos tecnológicos.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "Tener posibilidad de larga vigencia.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "Retratar bien en color o en blanco y negro.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TitulosHeader(
                    subtitulo:
                        "Dos estudiantes de la licenciatura en diseño gráfico de la UAM-Azcapotzalco, apegados a los lineamientos generaron logotipos e imágenes, resultando ganador el presentado por la C. Guadalupe Gómez Sánchez, durante el simposium Tecno-Industria ESCOM-95. En marzo de 2011 se incluyó la leyenda Instituto Politécnico Nacional.",
                    subtituloNegrita: false,
                    tamanoSubtitulo: 18,
                    tieneFondo: false,
                    tieneLineaIzquierda: true,
                    lineaHeight: 210,
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
    );
  }
}
