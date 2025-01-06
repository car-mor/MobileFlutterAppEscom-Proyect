import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends StatefulWidget {
  static const String name = 'history_screen';
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
      body: const _HistoryView(),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),

    );
  }
}

class _HistoryView extends ConsumerWidget {
  const _HistoryView();
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
                  titulo: "Historia & escudo",
                  subtitulo: "Conócenos",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                  tieneFondo: true,
                ),
          ),

          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Después de varios intentos que se hicieron al respecto, en 1993 un grupo de trabajo integrado por la Secretaría Académica del Instituto, elaboró un proyecto en el que se propuso la creación de la Escuela Superior de Cómputo, bajo la sigla (ESCOM) y al interior de ella la carrera de Ingeniero en Sistemas Computacionales.\n\n Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993. Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
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
