import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropiedadIntelectualScreen extends StatefulWidget {
  static const String name = 'propiedad_intelectual_screen';
  const PropiedadIntelectualScreen({super.key});
  @override
  State<PropiedadIntelectualScreen> createState() => _PropiedadIntelectualScreenState();
}

class _PropiedadIntelectualScreenState extends State<PropiedadIntelectualScreen> {
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
      body: const _PropiedadIntelectualView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),

    );
  }
}

class _PropiedadIntelectualView extends ConsumerWidget {
  const _PropiedadIntelectualView();
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
                  titulo: "X",
                  subtitulo: "X",
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
