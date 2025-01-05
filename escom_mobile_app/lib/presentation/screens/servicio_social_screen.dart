import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServicioSocialScreen extends StatefulWidget {
  static const String name = 'servicio_social_screen';
  const ServicioSocialScreen({super.key});
  @override
  State<ServicioSocialScreen> createState() => _ServicioSocialScreenState();
}

class _ServicioSocialScreenState extends State<ServicioSocialScreen> {
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
      body: const _ServicioSocialScreenView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),

    );
  }
}

class _ServicioSocialScreenView extends ConsumerWidget {
  const _ServicioSocialScreenView();
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
