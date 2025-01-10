import 'package:flutter/material.dart';

class LicensesScreen extends StatelessWidget {
  static const String name = 'licenses_screen';

  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licencias'),
      ),
      body: const _LicensesView(),
    );
  }
}

class _LicensesView extends StatelessWidget {
  const _LicensesView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Licencias',
          ),
        ],
      ),
    );
  }
}

//Cuadro de dialogo de confirmación
// void openDialog( BuildContext context ) {

//     showDialog(
//       context: context, 
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: const Text('¿Estás seguro?'),
//         content: const Text('Ex sit ea est in. Aliqua cillum amet tempor id officia tempor adipisicing amet commodo aliqua. Ut eiusmod cillum nulla sit ut non minim laboris cupidatat exercitation minim magna pariatur est. Nisi aute ea id enim sint occaecat aute adipisicing duis qui nisi. Nulla cillum nulla eiusmod enim magna sint eu dolor occaecat cupidatat.'),
//         actions: [
//           TextButton( onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          
//           FilledButton( onPressed: ()=> context.pop(), child: const Text('Aceptar')),
//         ],
//       ),
//     );

//   }