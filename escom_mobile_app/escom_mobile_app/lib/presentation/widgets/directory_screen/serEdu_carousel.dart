import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SerEduCarousel extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'image': 'assets/images/asuncion.jpg',
      'name': 'Dr. José Asunción Enríquez Zárate',
      'position': 'Subdirección de Servicios Educativos e Integración Social',
      'email': 'sseisescom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52012',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    {
      'image': 'assets/images/erick.jpg',
      'name': 'Ing. Erick Fernández Franco',
      'position': 'Depto. de Gestión Escolar',
      'email': 'sescolares_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52007',
      'location': 'Edificio de Gobierno, planta baja',
      'twitter': '',
    },
    {
      'image': 'assets/images/alvaro.jpg',
      'name': 'C. Álvaro Olvera Toral',
      'position': 'Depto. de Servicios Estudiantiles',
      'email': 'studiantiles_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52025',
      'location': 'Edificio de Gobierno, biblioteca',
      'twitter': '',
    },
    {
      'image': 'assets/images/francisco.jpg',
      'name': 'Lic. José Francisco Serrano García',
      'position': 'Depto. de Extensión y Apoyos Educativos',
      'email': 'ext_ae_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52056',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    {
      'image': 'assets/images/placeholder.jpg',
      'name': 'Lic. Norma Olalde Mogollán',
      'position': 'Unidad Politécnica de Integración Social',
      'email': 'escom_upis@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52005',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    // Agrega más contactos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Ajusta la altura según el diseño
      child: Swiper(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagen circular
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(contact['image']!),
                  ),
                  const SizedBox(height: 10),
                  // Nombre
                  Text(
                    contact['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  // Puesto
                  Text(
                    contact['position']!,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Información de contacto
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(contact['email']!),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(contact['phone']!),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(contact['location']!),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.alternate_email, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(contact['twitter']!),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        autoplay: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).primaryColor,
            color: Colors.grey,
          ),
        ),
        control: SwiperControl(),
      ),
    );
  }
}
