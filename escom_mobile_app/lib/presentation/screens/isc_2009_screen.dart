import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ISC2009Screen extends ConsumerWidget {

  static const String name = 'isc_2009_screen';

  const ISC2009Screen({super.key});

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
                  titulo: "INGENIERÍA EN SISTEMAS COMPUTACIONALES (2009)",
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
                              'Formar Ingenieros en Sistemas Computacionales que cuenten con una sólida formación integral que les permita proponer, analizar, diseñar, desarrollar, implementar, gestionar y administrar sistemas computacionales usando tecnologías de vanguardia y aplicando metodologías, normas y estándares nacionales e internacionales de calidad, con el propósito de crear, mejorar y sistematizar procesos administrativos e industriales en el área computacional. Integrar y administrar equipos de trabajo inter y multidisciplinarios, así como multiculturales, con actitud de liderazgo, ética y responsabilidad. Actualizándose permanentemente para responder a las necesidades de la sociedad y al desarrollo sustentable de la nación.',
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
                              'Los estudiantes que ingresen a la ESCOM deberán contar con las siguientes habilidades derivadas del perfil de egreso del nivel medio superior:'
                              '• Investigación, análisis y síntesis de información'
                              '• Criterio y razonamiento lógico para la solución de problemas'
                              '• Expresión oral y escrita'
                              '• Actitudes de: respeto, responsabilidad'
                              '• Interesado en las ciencias básicas y tecnologías de cómputo'
                              '• Asumir una posición activa con respecto al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN',
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
                              'Los egresados cuentan con una sólida formación integral, para proponer, analizar, diseñar, desarrollar, implementar, gestionar y administrar sistemas computacionales usando tecnologías de cómputo de vanguardia y aplicando metodologías, normas y estándares nacionales e internacionales de calidad para crear, mejorar y sistematizar procesos administrativos e industriales. Por lo que son capaces de desempeñarse en los sectores privado, público y de investigación, e integrar y administrar equipos de trabajo inter y multidisciplinarios, con actitud de liderazgo, ética y responsabilidad. Actualizándose permanentemente para responder a las necesidades de la sociedad y al desarrollo sustentable de la nación.',
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
                              'Los atributos de egreso son un conjunto de resultados evaluables individualmente, que conforman los componentes indicativos del potencial de un egresado para adquirir las competencias o capacidades para ejercer la práctica de la ingeniería a un nivel apropiado.\nSon los resultados de aprendizaje medibles describiendo o ejemplificando los conocimientos, habilidades y actitudes esperados de un egresado de un programa educativo que proporciona los fundamentos educativos para un propósito particular, incluyendo la práctica en una determinada ocupación de la ingeniería.\n\n'
                              '1. Identificar, modelar y resolver problemas en sistemas computacionales aplicando conocimientos de las ciencias básicas e ingeniería, a través de metodologías de desarrollo, análisis de resultados y toma de decisiones\n\n'
                              '2. Desarrollar sistemas computacionales de acuerdo a procesos de diseño, estándares de calidad y optimización de procesos\n\n'
                              '3. Integrar habilidades de liderazgo, comunicación efectiva y trabajo colaborativo para la planificación de tareas, cumplimiento de metas y análisis de riesgos\n\n'
                              '4. Asumir una actitud ética y crítica en su desempeño académico considerando su impacto económico, social y ambiental; reconociendo sus necesidades de actualización permanente',
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
                              'El Ingeniero en Sistemas Computacionales se desempeña en los sectores privado, público, académico y ejercicio libre de la profesión.\n\n'
                              '• Ejercicio libre de la profesión: Prestando de forma independiente sus servicios profesionales a los sectores público y privado. Constituyendo empresas formales que presten sus servicios computacionales a los diversos sectores\n'
                              '• Sector público: Participa automatizando procesos administrativos en entidades gubernamentales en todos sus niveles, así como desarrollando software especializado para satisfacer los requerimientos específicos de dependencias gubernamentales\n'
                              '• Sector privado: Se desempeñan como diseñadores y desarrolladores, líderes y administradores de proyectos computacionales, en empresas de transformación, servicios y comerciales, nacionales e internacionales\n'
                              '• Sector académico: Incorporándose a instituciones educativas de nivel medio superior y/o superior como docentes e investigadores. Incorporándose a centros de investigación nacionales e internacionales en sus planes de posgrado, participando en actividades tales como: desarrollo de nuevas tecnologías, divulgación del conocimiento y docencia\n',
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
                              'Los objetivos educacionales del programa constituyen una visión del éxito de sus egresados, y representan una aspiración para los estudiantes que cursan el PE o que están considerando ingresar al mismo.\n\n'
                              '1. Cuenta con una sólida formación integral que les permite proponer, analizar, diseñar, desarrollar, implementar, gestionar y administrar sistemas computacionales usando tecnologías de vanguardia y aplicando metodologías, normas y estándares nacionales e internacionales de calidad\n'
                              '2. Participa mediante la creación, mejoramiento y sistematización de los procesos administrativos e industriales en el área computacional\n'
                              '3. Integra y administra equipos de trabajo inter y multidisciplinarios, así como multiculturales, con actitud de liderazgo, ética y responsabilidad\n'
                              '4. Permanece actualizado para responder a las necesidades de la sociedad y al desarrollo sustentable de la nación\n',
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
                              'En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n\n'
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
                            Image.asset('assets/images/mapaCurricularISC2009.jpg'), 
                          ],
                        )      
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => _launchURL('https://www.escom.ipn.mx/docs/oferta/mapaCurricularISC2009.pdf'),
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