import 'package:flutter/material.dart';
//import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
//import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuSection {
  final String title;
  final Widget content;
  final IconData icon;

  MenuSection({
    required this.title,
    required this.content,
    required this.icon,
  });
}

class ExpandableMenu extends StatefulWidget {
  const ExpandableMenu({super.key});

  @override
  State<ExpandableMenu> createState() => _ExpandableMenuState();
  
}

class _ExpandableMenuState extends State<ExpandableMenu> {
  int? selectedIndex;

  final List<MenuSection> sections = [
    MenuSection(
      title: '¿Que es COSECOVI?',
      icon: Icons.shield,
      content: const Text(
        'Los Comités de Seguridad y Contra la Violencia en las dependencias politécnicas pretenden ser una herramienta para crear programas y acciones que fomenten los valores entre la comunidad politécnica, que promuevan la colaboración entre alumnos, docentes y personal administrativo e instrumenten medidas de orientación, prevención, capacitación, corrección y rectificación de situaciones que afecten el bienestar y la integridad de la propia comunidad.',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    ),
    MenuSection(
      title: 'Funciones',
      icon: Icons.list,
      content: Column(
        children: [
              const Text(
                'Los Comités de Seguridad y Contra la Violencia deben:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              ...[
                        'Crear programas, acciones y fomentar valores para mantener un ambiente armónico entre la comunidad estudiantil, que permita el buen desempeño de las actividades y de gestión.',
                        'Promover la colaboración responsable equilibrada y productiva de alumnos, docentes y administrativos para lograr una escuela y comunidad segura por medio del respeto y la aplicación de la normatividad interna.',
                        'Instrumentar medidas de orientación, prevención, capacitación, corrección y rectificación, de situaciones que afecten el bienestar y la integridad física de alumnos, directivos y personal docente y de apoyo a la docencia en cada escuela.',
                        'Promover una política de prevención contra todos aquellos actos antisociales o delictivos que pudieran generarse al interior del IPN, que atenten contra la integridad física de las personas de su comunidad o afecten sus instalaciones, con lo cual se lesionen la imagen de la institución y la vida académica de las dependencias politécnicas.',
                      ].map((miembros) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 8.0), // Ajusta el espacio vertical de la viñeta
                                    child: Icon(Icons.circle, size: 8), // Viñeta en círculo negro
                                  ),
                                const SizedBox(width: 8),
                                Flexible(  // Flexible también se puede usar para asegurar que el texto se ajuste
                                  child: Text(
                                    miembros,
                                    style: const TextStyle(fontSize: 16),
                                    softWrap: true,  // Permite que el texto se divida en múltiples líneas
                                    overflow: TextOverflow.visible,  // Evita el recorte del texto
                                  ),
                                ),
                              ],
                            ),
                          )),
        ],
      ),

    ),
    MenuSection(
      title: 'Contacto',
      icon: Icons.contact_page,
      content: const Column(
        children: [
          Text(
            'CONTACTANOS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/COSECOVI/andres.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'M. en C. Andrés Ortigoza Campos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          SizedBox(height: 8),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.phone, size: 16),
              SizedBox(width: 8),
              Text('55 5729 6000 Ext. 46188'),
            ],
          ),
          SizedBox(height: 8), 
          Row(
            children: [
              FaIcon(FontAwesomeIcons.envelope, size: 16),
              SizedBox(width: 8),
              Text('direccion_escom@ipn.mx'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.clock, size: 16),
              SizedBox(width: 8),
              Text('Lunes a viernes: 9 a 15 horas y 18 a 21 horas'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.twitter, size: 16),
              SizedBox(width: 8),
              Text('aortigozac_ipn'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.locationPin, size: 16),
              SizedBox(width: 8),
              Text(' Edificio de Gobierno, primer piso'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Estimada ESCOMunidad, puedes contactarnos a través de la dirección de correo electrónico en la que podrás escribir tus dudas, comentarios, propuestas y/o en su caso denuncias, si reconoces que estás siendo víctima de violencia y/o estés viviendo una situación que afecte tu integridad física o mental.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
    MenuSection(
      title: 'Estrucrutura',
      icon: FontAwesomeIcons.diagramProject,
      content: Column(
        children: [
          const Text(
            'Estructura COSECOVI',
            style: TextStyle(
            color: Color.fromRGBO(23, 162, 184, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        
        DataTable(
  columns: const [
    DataColumn(label: Text('Cargo', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Nombre')),
  ],
  rows: [
    DataRow(cells: [
      const DataCell(Text('Presidente',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity, // Asegura que la celda ocupe todo el ancho disponible
        child: const Text('M. en C. Andrés Ortigoza Campos',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Secretario',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('M. en C. Ivan Giovanny Mosso García',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Coordinador',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('M. en C. José Asunción Enríquez Zárate',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Coordinador Suplente',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('C. Alvaro Olvera Toral',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Vocal Enlace Red de Género',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('Dra. Ana María Winfield Reyes',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Vocal Enlace con la Oficina de Abogado General',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('M. en E. Elia Tzindejhé Ramírez Martínez',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Vocal de Tecnologías de la Información',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('M. en D. T. I. Ricardo Ángel Aguilar Pérez',  style: TextStyle(fontSize: 12)),
      )),
    ]),
    DataRow(cells: [
      const DataCell(Text('Vocal de Apoyo',  style: TextStyle(fontSize: 12))),
      DataCell(Container(
        width: double.infinity,
        child: const Text('C. Arturo Médécigo Rodríguez',  style: TextStyle(fontSize: 12)),
      )),
    ]),
  ],
)
        ],
      ),
    ),
    MenuSection(
      title: 'Directorio',
      icon: Icons.folder,
      content: Column(
        children: [
              Image.asset(
                'assets/images/COSECOVI/Vinculacion.png',
                width: 300,
                height: 300,
              ),
        ],
      ),
    ),
    MenuSection(
      title: 'Protocolos de Actuación',
      icon: Icons.description,
      content: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('Gaceta 1519'),
            subtitle: const Text(
              'Protocolo para la Prevención, Detección, Atención y Sanción de la Violencia de Género.',
            ),
            onTap: () async {
              const url = 'https://www.gob.mx/aem/documentos/protocolo-para-la-prevencion-atencion-y-sancion-del-hostigamiento-sexual-y-acoso-sexual-dof-03-01-2020';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se puede abrir el URL $url';
    }
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('DOF: 03/01/2020'),
            subtitle: const Text(
              'Protocolo para la Prevención, Atención y Sanción del Hostigamiento Sexual y Acoso Sexual.',
            ),
            onTap: () async {
              const url = 'https://www.ipn.mx/assets/files/zacatecas/docs/genero/Protocolo.pdf';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se puede abrir el URL $url';
    }
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('Protocolo De Atención'),
            subtitle: const Text(
              'Cumplimiento a la Revisión Y Actualización Del Protocolo De Atención ante un Acto De Violencia En Contra De Un Miembro De La Comunidad.',
            ),
            onTap: () async {
              const url = 'https://www.escom.ipn.mx/SSEIS/cosecovi/docs/protocolos/PROTOCOLO_DE_ATENCION_COMUNIDAD_POLITECNICA.pdf';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se puede abrir el URL $url';
    }
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('Aplicación Mi Policía'),
            subtitle: const Text(
              'Una App creada para informar y proteger a todos los ciudadanos de la CDMX.',
            ),
            onTap: () async {
              const url = 'https://escom.ipn.mx/SSEIS/cosecovi/docs/protocolos/Triptico_APP_Mi_Policia.pdf';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se puede abrir el URL $url';
    }
            },
          ),
        ],
      ),
    ),
    MenuSection(
      title: 'Plataforma de Denuncia Segura',
      icon: Icons.remove_red_eye_sharp,
      content: Column(
        children: [
              Image.asset(
                'assets/images/COSECOVI/Linea_de_denuncia_1.jpeg',
                width: 300,
                height: 300,
              ),
              
        ],
      ),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = isSelected ? null : index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                    child: Row(
                      children: [
                        Icon(
                          sections[index].icon,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            sections[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? Colors.blue : const Color.fromARGB(255, 158, 158, 158),
                            ),
                          ),
                        ),
                        Icon(
                          isSelected ? Icons.expand_less : Icons.expand_more,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: sections[index].content,
                  ),
                const Divider(height: 1),
              ],
            );
          },
        ),
      ],
    );
  }
}