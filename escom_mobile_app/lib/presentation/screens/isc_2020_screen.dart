import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ISC2020Screen extends ConsumerWidget {

  static const String name = 'isc_2020_screen';

  const ISC2020Screen({super.key});


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
                  titulo: "INGENIERÍA EN SISTEMAS COMPUTACIONALES (2020)",
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
              padding: const EdgeInsets.all(16),
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
                              'Formar ingenieros en sistemas computacionales de sólida preparación científica y tecnológica en los ámbitos del desarrollo de software y hardware, que propongan, analicen, diseñen, desarrollen, implementen y gestionen sistemas computacionales a partir de tecnologías de vanguardia y metodologías, normas y estándares nacionales e internacionales de calidad; líderes de equipos de trabajo multidisciplinarios y multiculturales, con un alto sentido ético y de responsabilidad.',
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
                              'Los aspirantes a estudiar este programa deberán tener conocimientos en matemáticas, física e informática. Es también conveniente que posea conocimientos de inglés. Así mismo, deberán contar con habilidades como análisis y síntesis de información, razonamiento lógico y expresión oral y escrita. Así como actitudes de respeto y responsabilidad.',                              
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
                              'El egresado del programa académico de Ingeniería en Sistemas Computacionales podrá desempeñarse en equipos multidisciplinarios e interdisciplinarios en los ámbitos del desarrollo de software y hardware, sustentando su actuación profesional en valores éticos y de responsabilidad social, con un enfoque de liderazgo y sostenibilidad en los sectores público y privado.',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Redes sociales
                  Row(
                    children: [ 
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Atributos del Egresado',
                              style: titleStyle,  
                            ),
                            Text(
                              'Los atributos de egreso son un conjunto de resultados evaluables individualmente, que conforman los componentes indicativos del potencial de un egresado para adquirir las competencias o capacidades para ejercer la práctica de la ingeniería a un nivel apropiado.\n\n'
                              '1. Modelar problemas en sistemas computacionales a partir de conocimientos de ciencias básicas e ingeniería\n'
                              '2. Resolver problemas en sistemas computacionales, con base en la metodología de desarrollo, análisis de resultados y toma de decisiones\n'
                              '3. Desarrollar sistemas computacionales de acuerdo a procesos de diseño, estándares de calidad y optimización de procesos\n'
                              '4. Integrar habilidades de liderazgo, comunicación efectiva y trabajo colaborativo para la planificación de tareas, cumplimiento de metas y análisis de riesgos\n'
                              '5. Asumir una actitud ética y crítica en su desempeño académico que considere su impacto económico, social y ambiental y que reconozca sus necesidades de actualización permanente',
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
                              'El campo profesional en el que se desarrollan los egresados de este Programa Académico es muy amplio, se localiza en los sectores público y privado; en consultorías, en empresas del sector financiero, comercial, de servicios o bien en aquellas dedicadas a la innovación, en entidades federales, estatales, así como pequeño empresario creando empresas emergentes (startups).\n\n',
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
                              'Objetivos Educacionales',
                              style: titleStyle,  
                            ),
                            Text(
                              'Formar Ingenieros en Sistemas Computacionales que cuenten con una sólida formación integral que les permita proponer, analizar, diseñar, desarrollar, implementar, gestionar y administrar sistemas computacionales usando tecnologías de vanguardia y aplicando metodologías, normas y estándares nacionales e internacionales de calidad, con el propósito de crear, mejorar y sistematizar procesos administrativos e industriales en el área computacional. Integrar y administrar equipos de trabajo inter y multidisciplinarios, así como multiculturales, con actitud de liderazgo, ética y responsabilidad. Actualizándose permanentemente para responder a las necesidades de la sociedad y al desarrollo sustentable de la nación.\n\n',
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
                            Image.asset('assets/images/mapaCurricularISC2020.jpg'),
                            
                          ],
                        )      
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => _launchURL('https://www.escom.ipn.mx/docs/oferta/mapaCurricularISC2020.pdf'),
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
                    onTap: () => _launchURL('https://www.escom.ipn.mx/docs/oferta/mapaCurricularISC2020_optativas.pdf'),
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
 