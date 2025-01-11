import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SubdirCarousel extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'image': 'assets/images/giov.jpg',
      'name': 'M. en C. Iván Giovanny Mosso García',
      'position': 'Subdirección Académica',
      'email': 'sub_academica_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52023',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    {
      'image': 'assets/images/rosario.jpg',
      'name': 'M. en A.P. María del Rosario Galeana Chávez',
      'position': 'Depto. de Ciencias e Ingeniería de la Computación',
      'email': 'cic_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52067',
      'location': 'Edificio de laboratorios, Primer piso, sala 13',
      'twitter': '',
    },
    {
      'image': 'assets/images/dra_deni.png',
      'name': 'Dra. Deni del Carmen Becerril Elias',
      'position': 'Depto. de Ingeniería en Sistemas Computacionales',
      'email': 'escom_disc@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52072',
      'location': 'Edificio de laboratorios, Primer piso, sala 12',
      'twitter': '',
    },
    {
      'image': 'assets/images/magda.png',
      'name': ' M. en Adm. de N. María Magdalena Saldivar Almorejo',
      'position': 'Depto. de Formación Integral e Institucional',
      'email': 'fii_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52020',
      'location': 'Edificio de laboratorios, primer piso, cabecera',
      'twitter': '',
    },
    {
      'image': 'assets/images/placeholder.jpg',
      'name': 'Lic. Diana Gabriela Horcasitas Domínguez',
      'position': 'Depto. de Evaluación y Seguimiento Académico',
      'email': 'es_academico_escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52021',
      'location': 'Edificio de laboratorios, segundo piso, cabecera',
      'twitter': '',
    },
    {
      'image': 'assets/images/claudia.jpg',
      'name': 'Dra. Claudia Celia Díaz Huerta',
      'position': 'Depto. de Innovación Educativa',
      'email': 'innova.escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52044',
      'location': 'Edificio de Gobierno, primer piso',
      'twitter': '',
    },
    {
      'image': 'assets/images/ely.jpg',
      'name': 'M. en C. Elizabeth Moreno Galván',
      'position': 'Unidad de Tecnología Educativa y Campus Virtual',
      'email': 'uteycv.escom@ipn.mx',
      'phone': 'Tel. 57296000 Ext. 52011',
      'location': 'Edificio 1, salón 1001',
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
