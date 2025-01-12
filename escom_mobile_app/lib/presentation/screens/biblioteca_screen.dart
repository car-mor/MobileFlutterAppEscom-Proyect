import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BibliotecaScreen extends ConsumerWidget {

  static const String name = 'biblioteca_screen';

  const BibliotecaScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch URL: $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOM-MOBILE'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ProfileAvatar(
              imageUrl: null,
              size: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  imagePath: 'assets/images/header.png',
                  onToggleTheme: themeNotifier.toggleTheme,
                  isDarkMode: isDarkMode,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: 
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                                'Bienvenidos',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'En la biblioteca nuestro objetivo es facilitar a la comunidad de ESCOM el acceso a libros y bases de datos, a través de la Red Institucional de Bibliotecas y el uso de las tecnologías de la información y comunicación, con el fin de favorecer la generación del conocimiento y el desarrollo de la investigación científica y tecnológica.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Biblioteca',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Recomendaciones:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '1.- Existen libros para el turno matutino y vespertino. \n'
                        '2.- Existen libros "únicos" que son los de punto rojo y sólo se prestan para copias por una hora. \n'
                        '3.- Para cualquier servicio de la biblioteca se requiere la credencial vigente. \n'
                        '4.- La credencial de la biblioteca es de uso personal. \n'
                        '5.- El uso indebido de la credencial, materiales e instalaciones será sujeto de sanción. \n'
                        '6.- Se prohibe entrar con alimentos y bebidas. \n'
                        ,
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Documentos:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/Formato_de_Registro%202024.docx'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Formatos de Registro',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/politicasOperacionBiblioteca2024.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Políticas de operación de la biblioteca',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/Procedimiento_de_registro.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Formatos de registro y renovación de servicios bibliotecarios',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                      onTap: () => _launchURL('https://www.escom.ipn.mx/SSEIS/serviciosestudiantiles/documentos/escuelas.pdf'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0), // Alinear el círculo con el texto
                            child: Image.asset(
                            'assets/images/cultural_activities/pdfMini.png',  // Ruta de tu imagen
                            width: 30,  // Puedes ajustar el tamaño de la imagen
                          height: 30, // Puedes ajustar el tamaño de la imagen
                          ),
                            ),
                        const SizedBox(width: 8),
                        const Expanded( // Asegura que el texto ocupe el espacio disponible
                        child: Text(
                          'Lista de escuelas con convenios de préstamos interbibliotecarios',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        softWrap: true, // Permite que el texto haga un wrap si es largo
                        overflow: TextOverflow.visible, // Permite que todo el texto se muestre
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                                'Horario de Atención :',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.clock, size: 16),
                            const SizedBox(width: 8),
                            Text('De 08:30 a 20:00 horas', style: textStyle),
                          ],
                        ),
                      const SizedBox(height: 20),
                      const CustomSliderBiblioteca(), // Aquí se muestra el custom_slider
                      const SizedBox(height: 20),
                      const Text(
                                'Buscador de información',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: 'Catálogo IPN',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'BUSCAR EN CATÁLOGO',
                                isLink: true,
                                onTap: () => _launchURL('https://www.busqueda.dirbibliotecas.ipn.mx/F/-/?func=find-b&find_code=WRD&request='),
                              ),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Tesis Institucionales IPN',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'BUSCAR EN TESIS',
                                isLink: true,
                                onTap: () => _launchURL('https://tesis.ipn.mx/discover?scope=%2F&query='),
                              ),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Repositorio Digital IPN',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'BUSCAR EN REPOSITORIO',
                                isLink: true,
                                onTap: () => _launchURL('https://www.repositoriodigital.ipn.mx/simple-search?query='),
                              ),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Revistas y Libros',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'BUSCAR EN REVISTA/LIBRO',
                                isLink: true,
                                onTap: () => _launchURL('https://rc9kc2hb9u.search.serialssolutions.com/ejp/?libHash=RC9KC2HB9U#/search/?searchControl=title&searchType=alternate_title_begins&criteria='),
                              ),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'General',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'BUSCAR',
                                isLink: true,
                                onTap: () => _launchURL('https://www.conricyt.mx/'),
                              ),
                            ],
                        ),
                      ],
                    ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => _launchURL('https://www.ipn.mx/bibliotecas-publicaciones/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Clic para ir a: Recursos Digitales', 
                            style: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold,), selectionColor: Color.fromARGB(255, 115, 0, 150), )
                            ,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const FooterWidget(
                  imagePathTop: 'assets/images/logoSEP.png',
                  imagePathBottom: 'assets/images/logoGOB.png',
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}