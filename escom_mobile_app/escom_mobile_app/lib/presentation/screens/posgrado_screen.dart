import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosgradoScreen extends StatefulWidget {
  static const String name = 'posgrado_screen';
  const PosgradoScreen({super.key});
  @override
  State<PosgradoScreen> createState() => _PosgradoScreenState();
}

class _PosgradoScreenState extends State<PosgradoScreen> {
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
      body: const _PosgradoView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}

class _PosgradoView extends ConsumerWidget {
  const _PosgradoView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(
              imagePath: './../../../assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme,
              isDarkMode: isDarkMode),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: BorderSide.strokeAlignCenter),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Sección de Estudios de Posgrado e Investigación (SEPI)',
                  style: TextStyle(
                    color: Color.fromRGBO(23, 162, 184, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Les damos la más cordial bienvenida a la SEPI de la Escuela Superior de Cómputo (ESCOM) que acorde con la tradición del Instituto Politécnico Nacional debe ser una Institución rectora de la educación tecnológica pública en México y líder en la generación, aplicación, difusión y la trasnferencia de conocimiento científico y tecnológico; propone como parte de su crecimiento natural en el año de 2009 la Maestría en Ciencias en Sistemas Computacionales Móviles, con el objetivo de formar personal altamente calificado y competitivo a nivel internacional, que contribuya a generar, innovar y aplicar la computación móvil en la resolución de las diferentes necesidades del país.',
                  style: textStyle,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                  'Nuestro programa de posgrado es joven; sin embargo, quienes conformamos el equipo de trabajo de la Escuela Superior de Cómputo, tenemos una enorme experiencia en educación superior y posgrado, tanto a nivel nacional como en el extranjero.',
                  style: textStyle,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                
               const Text(
                  'Jefe de la Sección de Estudios de Posgrado e Investigación',
                  style: TextStyle(
                    color: Color.fromRGBO(23, 162, 184, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                 const Align(
                  alignment: Alignment.centerLeft,
                    child: Text(
                    'Objetivo',
                    style: TextStyle(
                      color: Color.fromRGBO(23, 162, 184, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                                   ),
                 ),
                const SizedBox(height: 20),

              ],
            ),
          ),
          const FooterWidget(
            imagePathTop: 'assets/images/logoSEP.png',
            imagePathBottom: 'assets/images/logoGOB.png',
          ),
        ]),
      ),
    );
  }
}
