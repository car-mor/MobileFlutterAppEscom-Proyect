import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LCDScreen extends ConsumerWidget {

  static const String name = 'lcd_screen';

  const LCDScreen({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final Color textoColor = isDarkMode ? Colors.white : Colors.black;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textoColor,
        );
    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textoColor,
        );

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              imagePath: 'assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme, // Pasa la función
              isDarkMode: isDarkMode, // Pasa el estado
            ),

            // Información de la escuela con contenedor sombreado
            
            const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 14),
            child: TitulosHeader(
                  titulo: "Licenciatura en Ciencia de Datos (2020)",
                  subtitulo: "Oferta Educativa",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                  tieneFondo: true,
                ),
          ),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Objetivo',
                              style: titleStyle,  
                            ),
                            Text(
                              'Formar expertos capaces de extraer conocimiento implícito y complejo, potencialmente útil a partir de grandes conjuntos de datos, utilizando métodos de inteligencia artificial, aprendizaje de máquina, estadística, sistemas de bases de datos y modelos matemáticos sobre comportamientos probables, para apoyar la toma de decisiones de alta dirección.',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Teléfono
                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Perfil de Ingreso',
                              style: titleStyle,  
                            ),
                            Text(
                              'Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.',                             
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Correo electrónico
                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Perfil de Egreso',
                              style: titleStyle,  
                            ),
                            Text(
                              'El egresado de la Licenciatura de Ciencia de Datos será capaz de extraer conocimiento implícito y complejo, potencialmente útil (descubrimiento de patrones, desviaciones, anomalías, valores anómalos, situaciones interesantes, tendencias), a partir de grandes conjuntos de datos. Utiliza los métodos de la inteligencia artificial, aprendizaje de máquina, estadística y sistemas de bases de datos para la toma de decisiones de alta dirección, fundadas en los datos y modelos matemáticos sobre comportamientos probables, deseables e indeseables, participando en dinámicas de trabajo colaborativo e interdisciplinario con sentido ético y responsabilidad social.',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                
                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Campo Laboral',
                              style: titleStyle,  
                            ),
                            Text(
                              'Este profesional podrá desempeñarse en los ámbitos público y privado en campos ocupacionales como los que se enlistan a continuación:\n\n'
                              '• MERCADOTECNIA: Análisis de tendencias , publicidad dirigida, análisis de preferencias\n'
                              '• SALUD: Epidemiología, análisis de cobertura, análisis de mercados de medicamentos\n'
                              '• FINANZAS: Detección de fraudes, análisis de inversiones, análisis de mercados, perfil crediticio, análisis de riesgos\n'
                              '• BIOINFORMÁTICA: Modelos genéticos, modelos agronómicos\n'
                              '• ENERGÍA: Análisis del mercado, despacho de carga, análisis de consumos\n'
                              '• COMERCIO ELECTRÓNICO: Logística, Sistemas de Información Geográfica\n'
                              '• TRANSPORTE: Planeación de infraestructura y servicios, modelos de tráfico, geolocalizaciones\n'
                              '• EDUCACIÓN: Planeación y evaluación educativa\n'
                              '• NEGOCIOS: Planeación financiera, planeación de mercados, planeación de la producción\n'
                              '• SEGURIDAD: Análisis de tendencias, análisis geoestadístico, análisis delictivo\n'
                              '• PROTECCIÓN CIVIL: Mapas de riesgos, estrategias de prevención\n',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Titulación',
                              style: titleStyle,  
                            ),
                            Text(
                              'En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC), Ing. en Inteligencia Artificial (IIA), Lic. en Ciencia de Datos (LCD) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n\n'
                              '1. Proyecto de investigación\n'
                              '2. Tesis\n'
                              '3. Memoria de experiencia profesional\n'
                              '4. Examen de conocimiento por áreas\n'
                              '5. Créditos de posgrado\n'
                              '6. Seminario de titulación\n'
                              '7. Escolaridad\n'
                              '8. Curricular\n'
                              '9. Práctica profesional',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Mapa Curricular',
                              style: titleStyle, 
                            ),
                            Image.asset('assets/images/mapaCurricularLCD2020H.jpg'),
                            
                          ],
                        )      
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => _launchURL('https://www.escom.ipn.mx/docs/oferta/mapaCurricularLCD2020H.pdf'),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download),
                        SizedBox(width: 5),
                        Text('Mapa curricular'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => _launchURL('https://www.escom.ipn.mx/docs/oferta/mapaCurricularLCD2020_optativas.pdf'),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download),
                        SizedBox(width: 5),
                        Text('UA optativas'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const FooterWidget(
              imagePathTop: 'assets/images/logoSEP.png',
              imagePathBottom: 'assets/images/logoGOB.png',
            ),
          ],
        ),
      ),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}

void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }
