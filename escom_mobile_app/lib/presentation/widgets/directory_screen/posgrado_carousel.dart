import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PosgradoCarousel extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'image': 'assets/images/miguelAngel.jpg',
      'name': 'M. en D.E. Miguel Ángel Rodríguez Castillo',
      'position': 'Sección de Estudios de Posgrado e Investigación',
      'email': 'sepi_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52028',
      'location': 'Edificio 4, salón 2008',
      'twitter': '',
    },
    {
      'image': 'assets/images/paola.jpg',
      'name': ' M. en C. Paola Judith Maldonado Colín',
      'position': 'Depto. de Posgrado',
      'email': 'posgrado_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52038',
      'location': 'Edificio 4, salón 2008',
      'twitter': '',
    },
    {
      'image': 'assets/images/mayra.jpg',
      'name': ' M. en T.A.E. Mayra Hernández Contreras',
      'position': 'Depto. de Investigación',
      'email': 'investigacion_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52061',
      'location': 'Edificio 4, salón 2008',
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
