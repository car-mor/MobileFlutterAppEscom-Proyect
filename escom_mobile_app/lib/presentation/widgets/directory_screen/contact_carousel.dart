import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class ContactCarousel extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'image': 'assets/images/andres.jpg',
      'name': 'M. EN C. ANDRÉS ORTIGOZA CAMPOS',
      'position': 'Dirección',
      'email': 'direccion_escom@ipn.mx',
      'phone': '57296000 Ext. 46188',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '@aortigozac_ipn',
    },
    {
      'image': 'assets/images/ignacio.jpg',
      'name': 'M. en C. Ignacio Ríos de la Torre',
      'position': 'Decanato',
      'email': '-',
      'phone': 'Tel. 57296000 Ext. 52024',
      'location': 'Edificio 3, salón 1108',
      'twitter': '',
    },
    {
      'image': 'assets/images/laura.jpg',
      'name': 'M. en P. Laura Lazcano Xoxotla',
      'position': 'Coordinación de Enlace y Gestión Técnica',
      'email': 'enlace_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52013',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    {
      'image': 'assets/images/ricardoa.jpg',
      'name': ' M. en D.T.I. Ricardo Ángel Aguilar Pérez',
      'position': 'Unidad de Informátic',
      'email': 'udi_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52015',
      'location': 'Edificio 1, salón 1101',
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
