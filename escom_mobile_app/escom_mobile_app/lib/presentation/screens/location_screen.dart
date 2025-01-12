import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends ConsumerWidget {
  static const String name = 'location_screen';

  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
);
  //valores para el mapa
  const LatLng center = LatLng(19.502424,-99.14834); //coordenadas de ESCOM
  
  // Manejador de errores para la creación del mapa
    void onMapCreated(GoogleMapController controller) {
      // Aquí puedes agregar configuraciones adicionales para el mapa
    }
  
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
            
            // Información de la escuela REEMPLAZO DEL PLACEHOLDER
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Escuela Superior de Cómputo\n', //titulo
                      style: titleStyle,
                      textAlign: TextAlign.center, // Asegúrate de que el texto esté centrado
                  ),  
                  // Dirección
              const Row(
                children: [
                  Icon(Icons.location_on, color: Color.fromARGB(255, 78, 80, 82)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Av. Juan de Dios Bátiz s/n esq. Av. Miguel Othón de Mendizabal. '
                      'Colonia Lindavista. Alcaldía: Gustavo A. Madero. C. P. 07738. '
                      'Ciudad de México.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Teléfono
              const Row(
                children: [
                  Icon(Icons.phone, color: Color.fromARGB(255, 78, 80, 82)),
                  SizedBox(width: 8),
                  Text(
                    'Tel. 57296000 Ext. 46188',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Correo electrónico
              const Row(
                children: [
                  Icon(Icons.email, color: Color.fromARGB(255, 78, 80, 82)),
                  SizedBox(width: 8),
                  Text(
                    'direccion_escom@ipn.mx',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Redes sociales
              const Row(
                children: [
                  Icon(FontAwesomeIcons.facebook, color: Color.fromARGB(255, 78, 80, 82)),
                  SizedBox(width: 8),
                  Text(
                    'escomipnmx',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(FontAwesomeIcons.twitter, color: Color.fromARGB(255, 78, 80, 82)),
                  SizedBox(width: 8),
                  Text(
                    'escomunidad',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
                ]
              ),
            ),


            // Mapa 
            const SizedBox(height: 20),
                  // Recuadro para el mapa
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,  // 40% de la altura de la pantalla
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child:  
                      GoogleMap(
                        onMapCreated: onMapCreated,
                        initialCameraPosition: const CameraPosition(
                          target: center,
                          zoom: 15.0,
                        ),
                        markers: {
                        const Marker(
                          markerId: MarkerId('ESCOM'),
                          position: center,
                          infoWindow: InfoWindow(
                            title: 'ESCOM',
                            snippet: 'Escuela Superior de Cómputo',
                          ),
                        ),
                         },  // Mostrar el marcador
                      ),  
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
