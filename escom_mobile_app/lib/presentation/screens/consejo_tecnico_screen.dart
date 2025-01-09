import 'package:escom_mobile_app/presentation/widgets/footer.dart';
import 'package:flutter/material.dart';

class ConsejoTecnicoScreen extends StatelessWidget {

  static const String name = 'consejo_tecnico_screen';

  const ConsejoTecnicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FooterWidget(
              imagePathTop: 'assets/images/logoSEP.png',
              imagePathBottom: 'assets/images/logoGOB.png',
            );
  }
}
