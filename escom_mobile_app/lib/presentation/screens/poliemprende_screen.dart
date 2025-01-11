import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/footer.dart';
import 'package:escom_mobile_app/presentation/widgets/header.dart';
import 'package:escom_mobile_app/presentation/widgets/profile_avatar.dart';
import 'package:escom_mobile_app/presentation/widgets/side_menu.dart';
import 'package:escom_mobile_app/presentation/widgets/titulos_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoliemprendeScreen extends ConsumerWidget {

  static const String name = 'poliemprende_screen';

  const PoliemprendeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final Color textoColor = isDarkMode ? Colors.white : Colors.black; // Color del texto según el tema

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
    //Color del texto dependiendo el tema
    
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

            const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 14),
            child: TitulosHeader(
                  titulo: "POLIEMPRENDE",
                  subtitulo: "ESCOMUNIDAD",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                  tieneFondo: true,
                ),
          ),
        

            const SizedBox(height: 10),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [ 
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,  
                          children: [
                            Text(
                              'Fomento a la cultura emprendedora - ESCOM',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,

                              )
                              
                                
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/POLIEMPRENDE.png'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              '¿Qué es?',
                              style: titleStyle, 
                            ),
                            Text(
                              'Es el programa Institucional de Emprendedores, coordinado por la Dirección de Incubación de Empresas Tecnológicas - DIET(antes CIEBT).',
                              style: subtitleStyle,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Redes sociales
                  Row(
                    children: [ 
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              '¿Qué ofrece a la comunidad Politécnica?',
                              style: titleStyle,  
                            ),
                            Text(
                              'Apoyos para desarrollar habilidades emprendedoras y transformar una idea de negocio en una empresa innovadora, contribuyendo a formar profesionistas exitosos. Todo esto bajo el respaldo de la DIET.',
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
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Beneficios',
                              style: titleStyle, 
                            ),
                            Text(
                              'Comenzar tu propia empresa.\n'
                              'Desarrollar habilidades directivas.\n'
                              'Desarrollar capacidad de negociación.\n'
                              'Aprender a trabajar en equipo.\n'
                              'Acceso a foros empresariales, nacionales e internacionales.\n'
                              'Acceso a estancias de formación en México y en el extranjero.\n'
                              'Tener la oportunidad de liberar el servicio social.\n'
                              'Aplicar conocimientos técnicos para la solución de problemas reales.\n',
                              
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
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Requisitos',
                              style: titleStyle, 
                            ),
                            Text(
                              'Ser Politécnico (Nivel superior y posgrado).\n'
                              'Deseos de superación.\n'
                              'Perseverancia\n'
                              'Curiosidad por aprender.\n'
                              'Tener una idea posible de negocio.\n'
                              'Llenar un formato.\n',
                              
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

            Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Informes:',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lic. María Soledad Centeno Arrazola',
                      style: subtitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Para centrar el ícono y el texto
                      children: [
                        const Icon(Icons.phone, size: 18, color: Colors.grey),
                        const SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          'Tel. 57296000 Ext. 52005',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Para centrar el ícono y el texto
                      children: [
                        const Icon(Icons.email, size: 18, color: Colors.grey),
                        const SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          'mscenteno@ipn.mx',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
