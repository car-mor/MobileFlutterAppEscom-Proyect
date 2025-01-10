import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ISAScreen extends ConsumerWidget {

  static const String name = 'isa_screen';

  const ISAScreen({super.key});

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
                  titulo: "Ingeniería en Sistemas Automotrices",
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
                              'Preparar ingenieros altamente especializados para atender las necesidades en ingeniería automotriz y de autopartes en sus Áreas de: manufactura, diseño, automatización, procesos, sistemas inteligentes, protección ambiental, administración e innovación tecnológica.',
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
                              'El aspirante a estudiar la Carrera de Ingeniería en Sistemas Automotrices deberá haber egresado de cualquier institución pública o privada en el nivel medio superior o equivalente, dentro de alguna de las especialidades o área afines a las ciencias físico matemáticas, ello contribuirá al mejor equilibrio del conocimiento al ingreso. Aprobar el examen de admisión que el Instituto Politécnico Nacional establezca para este fin y atender los requerimientos de la convocatoria.\n'
                              'El aspirante deberá tener los siguientes conocimientos básicos capacidades actitudes y valores:\n\n'
                              '• Conocimientos teóricos y prácticos de las Ciencias Físico Matemáticas\n'
                              '• Uso de la metodología científica\n'
                              '• Capacidades de razonamiento lógico\n'
                              '• Actitudes de respeto y responsabilidad\n'
                              '• Análisis y síntesis hacia la aplicación del conocimiento\n'
                              '• Capacidad para expresarse mediante un lenguaje científico y cotidiano, tanto en forma oral como escrita\n'
                              '• Compresión manejo y aplicación de la información a través de diversos lenguajes gráficos, computacionales y simbólicos\n'
                              '• Habilidades manuales para el trabajo en laboratorio\n'
                              '• Disposición para el autoaprendizaje que propicie su desarrollo intelectual, emotivo y social\n'
                              '• Disposición a conocer la problemática nacional y participar en su solución',
                              
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
                              'Es un profesionista que aplica conocimientos de la matemática, las ciencias naturales, las ciencias sociales, humanísticas y administrativas que ha adquirido a través del estudio, la experiencia y la práctica, al desarrollo de actividades tales como:\n\n'
                              '• Participación, en programas de investigación, desarrollo tecnológico e ingenieróa experimental\n'
                              '• Planeación, dirección y/o ejecución en diseños y proyectos de ingeniería\n'
                              '• Dirección y/o ejecución de obras de construcción, instalación, producción y operación de bienes y servcios\n'
                              '• Realización de estudios y consultoria sobre aspectos técnicos, tecnológicos y/o procesos relativos en la especialidad\n'
                              '• Participación en los programas de elaboración de normas técnicas y de calidad para sistemas, productos, procesos y servicios\n'
                              '• Programación y desarrollo de actividades comerciales, de gestión y periciales\n'
                              '• Organización dirección y/o ejecución de programas de conservación y mantenimiento\n'
                              '• Realización de funciones en docencia e instrucción en programas escolarizados, de educación continua, de especialización o posgrado\n'
                              '• Manejo eficaz del idioma local y capacidad de comunicación en una lengua extranjera\n'
                              '• Redacción de documentos, artículos e informes técnicos y no técnicos\n'
                              '• Vinculación y participación en organismos gremiales, técnicos y culturales; nacionales y extranjeros\n'
                              '• Organización y supervisión del trabajo de personal dependiente\n'
                              '• Solución de problemas en beneficio de la persona y la sociedad en su conjunto, principalmente en las áreas de:\n'
                              '- Generación, conversión y conservación de la energía\n'
                              '- Sistemas de propulsión, transmisión y diseño de vehículos\n'
                              '- Seguridad\n'
                              '- Sistemas inteligentes para guiado y supervisión de sistemas en vehículos\n'
                              '- Producción industrial\n'
                              '- Instalaciones, maquinaria e infraestructura\n'
                              '- articipación en la economia del país\n'
                              '- Producción más limpia',
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
                              'Campo Laboral',
                              style: titleStyle,  
                            ),
                            Text(
                              'El egresado de la carrera de Ingeniería en Sistemas Automotrices cuenta con una formación altamente especializada y multidisciplinaria que le permite desempeñarse profesionalmente en el Sector Automotriz y de Autopartes con una alta eficiencia, en cualquiera de las áreas siguientes:\n\n'
                              '• Diseño de Vehículos y sus Componentes\n'
                              '• Manufactura de Autopartes\n'
                              '• Control de Calidad\n'
                              '• Ingeniería y Manufactura Asistidas por Computadora\n'
                              '• Líneas de Ensamble\n'
                              '• Desarrollo de Nuevas Tecnologías\n'
                              '• Dispositivos Electrónicos\n'
                              '• Materiales Compuestos\n'
                              '• Áreas de Planeación\n'
                              '• Ventas\n'
                              '• Comercialización',
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
                              '• Cubrir el Servicio Social bajo las modalidades que la legislación vigente permita\n'
                              '• Acreditación del idioma Inglés co-curricular a un nivel intermedio\n'
                              '• Se definirán líneas de titulación curricular para fomentar esta opción',
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
