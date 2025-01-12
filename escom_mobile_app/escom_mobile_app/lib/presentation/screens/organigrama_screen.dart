import 'package:escom_mobile_app/presentation/widgets/directory_screen/contact_carousel.dart';
import 'package:escom_mobile_app/presentation/widgets/directory_screen/serEdu_carousel.dart';
import 'package:escom_mobile_app/presentation/widgets/directory_screen/subAdmin_carousel.dart';
import 'package:escom_mobile_app/presentation/widgets/directory_screen/subDir_carousel.dart';
import 'package:escom_mobile_app/presentation/widgets/directory_screen/posgrado_carousel.dart';
import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrganigramaScreen extends ConsumerWidget {

  static const String name = 'organigrama_screen';

  const OrganigramaScreen({super.key});

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
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 14),
              child: TitulosHeader(
                titulo: "ORGANIGRAMA & DIRECTORIO",
                subtitulo: "Conócenos",
                tituloNegrita: true,
                subtituloNegrita: false,
                tamanoTitulo: 28,
                tamanoSubtitulo: 18,
                tieneFondo: true,
              ),
            ),
            const SizedBox(height: 20),

            // Aquí agregamos el cuerpo: menú vertical y carrusel
            
            const ExpansionTileExample(),
            
            const SizedBox(height: 12),
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

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

@override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: const Center(
            child: Text(
              'Organigrama',
              textAlign: TextAlign.center, // Alinea el texto al centro
            ),
          ),
          children: <Widget>[
             Image.asset('assets/images/organigramaESCOM.JPG'), //en lugar de la imagen quiero el carrusel
          ],
        ),
        ExpansionTile(
          title: const Text('Dirección'),
          children: <Widget>[
            ContactCarousel(),
          ],
        ),
        ExpansionTile(
          title: const Text('Sub. Académica'),
          children: <Widget>[
            SubdirCarousel(),
          ],
        ),
        ExpansionTile(
          title: const Text('Sección de Posgrado'),
          children: <Widget>[
            PosgradoCarousel(),
          ],
        ),
        ExpansionTile(
          title: const Text('Sub. de Servicios Educativos e Integración Social'),
          children: <Widget>[
            SerEduCarousel(),
          ],
        ),
        ExpansionTile(
          title: const Text('Sub. Administrativa'),
          children: <Widget>[
            SubadminCarousel(),
          ],
        ),
        
        
      ],
    );
  }
}