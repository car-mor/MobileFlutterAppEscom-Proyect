import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GaleriaTomaProtestaScreen extends StatefulWidget {
  static const String name = 'galeria_toma_protesta_screen';
  const GaleriaTomaProtestaScreen({super.key});
  @override
  State<GaleriaTomaProtestaScreen> createState() => _GaleriaTomaProtestaScreenState();
}

class _GaleriaTomaProtestaScreenState extends State<GaleriaTomaProtestaScreen> {
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
      body: const _GaleriaTomaProtestaView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),

    );
  }
}

class _GaleriaTomaProtestaView extends ConsumerWidget {
  const _GaleriaTomaProtestaView();
  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;


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
                  titulo: "Galería de tomas de protesta",
                  subtitulo: "Egresados",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                ),
          ),
          const Placeholder(
            fallbackHeight: 200,
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
