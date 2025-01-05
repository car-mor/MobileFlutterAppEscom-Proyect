import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ISC2009Screen extends ConsumerWidget {

  static const String name = 'isc_2009_screen';

  const ISC2009Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Fondo sombreado
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Sombra
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2), // Desplazamiento de la sombra
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'INGENIERÍA EN SISTEMAS COMPUTACIONALES (2009)',
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Oferta Educativa',
                    style: subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [ 
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Objetivo',
                              style: titleStyle,  
                            ),
                            Text(
                              'Formar expertos capaces de desarrollar sistemas inteligentes utilizando diferentes metodologías en las diferentes etapas de desarrollo y aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados para atender las necesidades de los diferentes sectores de la sociedad a través de la generación de procesos y soluciones innovadoras.',
                              style: subtitleStyle,
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
                      const SizedBox(width: 8),
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
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Perfil de Egreso',
                              style: titleStyle,  
                            ),
                            Text(
                              'El egresado de la Ingeniería en Inteligencia Artificial se desempeñará colaborativamente en equipos multidisciplinarios en el análisis, diseño, implementación, validación, implantación, supervisión y gestión de sistemas inteligentes, aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados; ejerciendo su profesión con liderazgo, ética y responsabilidad social.',
                              style: subtitleStyle,
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
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Campo Laboral',
                              style: titleStyle,  
                            ),
                            Text(
                              'Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:\n\n'
                              '• MEDICINA PERSONALIZADA: Procesos en el ámbito médico tales como el pre diagnóstico, análisis de imágenes médicas, análisis de historiales clínicos.\n\n'
                              '• ASISTENCIA Y MOVILIDAD PARA PERSONAS CON DISCAPACIDAD O DE LA TERCERA EDAD: Recursos que faciliten la movilidad y el acceso a servicios a través de diferentes medios, como: sillas de ruedas autónomas, guías inteligentes, traductores automáticos, generadores de texto, software de terapia y de acompañamiento.\n\n'
                              '• CIUDADES INTELIGENTES Y SOSTENIBLES: Sistemas inteligentes para mejorar la calidad de vida aplicados al transporte autónomo, identificación biométrica, detección de fraude, prevención y detección de accidentes, tutores inteligentes, control de tráfico vehicular, monitoreo y alertamiento ambiental, protección civil.',
                              style: subtitleStyle,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [ 
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Titulación',
                              style: titleStyle,  
                            ),
                            Text(
                              'En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC), Ing. en Inteligencia Artificial (IIA), Lic. en Ciencia de Datos (LCD) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n'
                              '1. Proyecto de investigación\n'
                              '2. Tesis\n'
                              '3. Memoria de experiencia profesional\n'
                              '4. Examen de conocimiento por áreas\n'
                              '5. Créditos de posgrado\n'
                              '6. Seminario de titulación\n'
                              '7. Escolaridad\n'
                              '8. Curricular\n'
                              '9. Práctica profesional.',
                              style: subtitleStyle,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
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
