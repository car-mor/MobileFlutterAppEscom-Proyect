import 'package:escom_mobile_app/presentation/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ConsejoTecnicoScreen extends ConsumerWidget {

  static const String name = 'consejo_tecnico_screen';

  const ConsejoTecnicoScreen({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
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
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 14),
                        child: TitulosHeader(
                          titulo: "XXX CONSEJO TÉCNICO CONSULTIVO ESCOLAR (2024-2025)",
                          subtitulo: "Conócenos",
                          tituloNegrita: true,
                          subtituloNegrita: false,
                          tamanoTitulo: 28,
                          tamanoSubtitulo: 18,
                          tieneFondo: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Es formado por el Director, Subdirectores del plantel, Jefe de la SEPI, Jefes de Departamentos Académicos, el Decano y los Representantes Sindicales de Docentes y Personal de Apoyo a la Educación; además de docentes representantes de cada Departamento Académico, así como de alumnos representantes de todos los semestres.',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Funciones del Consejo Técnico Consultivo Escolar',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'La Ley Orgánica del Instituto Politécnico Nacional en su artículo 29 establece que "Compete a los Consejos Técnicos Consultivos Escolares":',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                          ...[
                        'Estudiar los proyectos de carácter académico, técnico y administrativo que le presenten el Director, los profesores y los alumnos de la escuela, centro o unidad',
                        'Formular los proyectos de normas internas de organización y funcionamiento de la escuela, centro o unidad y someterlos por conducto de su Director a la Consideración del Director General',
                        'Informar al Director General y al Consejo General Consultivo de los asuntos sobre los cuales estimen necesaria su intervención',
                        'Proponer al Director General del Instituto una terna de profesores para la designación del director de la escuela, centro o unidad. Para la elección de la terna, asumirá la presidencia del Consejo el Decano del Plantel',
                        'Proponer al Director General del Instituto, una terna de profesores para la designación de los directores adjuntos, así como una terna para la designación de los subdirectores de las escuelas, centros y unidades de enseñanza y de investigación',
                        'Resolver los asuntos que interesen o afecten a la escuela, centro o unidad y que sean sometidos a su consideración por el director del Plantel y',
                        'Las demás funciones que prevean esta ley y otros ordenamientos aplicables',
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
                                    style: textStyle,
                                    softWrap: true,  // Permite que el texto se divida en múltiples líneas
                                    overflow: TextOverflow.visible,  // Evita el recorte del texto
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Integrantes',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: 'Funcionarios',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'M. en C. Ignacio Ríos de la Torre'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'M. en D.E. Miguel Ángel Rodríguez Castillo'),
                              ContentItem(content: 'M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'M. en A. de N. María Magdalena Saldívar Almorejo'),
                              ContentItem(content: 'M. en A.P. María del Rosario Galeana Chávez'),
                              ContentItem(content: 'Dra. Deni del Carmen Becerril Elías'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Docentes',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Ing. Patricia Escamilla Miranda (ISC)'),
                              ContentItem(content: 'Dr. Ángel Morales González (ISC)'),
                              ContentItem(content: 'Dra. Luz María Sánchez García (IIA)'),
                              ContentItem(content: 'Dra. Maribel Aragón García (IIA)'),
                              ContentItem(content: 'Ing. Tania Rodríguez Sarabia (LCD)'),
                              ContentItem(content: 'M. en E. Mariana Gómez Tress (LCD)'),
                              ContentItem(content: 'Dr. Alfonso Fernández Vázquez (MCSCM)'),
                              ContentItem(content: 'Dra. Miriam Pescador Rojas (MCSCM))'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Estudiantes',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                              ContentItem(content: 'Ing. Imanol Paz Roldan Chávez (MCSCM)'),
                              ContentItem(content: 'Ing. Halder Vladimir Galdo Navarro (MCSCM)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Sindicatos',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'C. José Rubén Román Trejo / Sindicato PAAE'),
                              ContentItem(content: 'Dr. Gilberto Sánchez Quintanilla / Sindicato Docente'),
                            ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Comisiones',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: 'Planes y Programas',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'M. en D.E. Miguel Ángel Rodríguez Castillo'),
                              ContentItem(content: 'M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'M. en A. de N. María Magdalena Saldívar Almorejo'),
                              ContentItem(content: 'M. en A.P. María del Rosario Galeana Chávez'),
                              ContentItem(content: 'Dra. Deni del Carmen Becerril Elías'),
                              ContentItem(content: 'Ing. Patricia Escamilla Miranda (ISC)'),
                              ContentItem(content: 'Dra. Maribel Aragón García (IIA)'),
                              ContentItem(content: 'Ing. Tania Rodríguez Sarabia (LCD)'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Normatividad',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en D. E. Miguel Ángel Rodríguez Castillo'),
                              ContentItem(content: 'M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'M. en A. de N. María Magdalena Saldívar Almorejo'),
                              ContentItem(content: 'Dra. Luz María Sánchez García (IIA)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Honor',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'M. en D. E. Miguel Ángel Roríguez Castillo'),
                              ContentItem(content: 'M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'M. en A.P. María del Rosario Galeana Chávez'),
                              ContentItem(content: 'Dra. Deni del Carmen Becerril Elías'),
                              ContentItem(content: 'M. en E. Mariana Gómez Tress (LCD)'),
                              ContentItem(content: 'Dr. Alfonso Fernández Vázquez (MCSCM)'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'Ing. Imanol Paz Roldan Chávez (MCSCM)'),
                              ContentItem(content: 'Ing. Halder Vladimir Galdo Navarro (MCSCM)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Situación Escolar',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'M. en D. E. Miguel Ángel Rodríguez Castillo'),
                              ContentItem(content: 'M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'C. Daniela López Vega (invitada, Jefa del Departamento de Gestión Escolar)'),
                              ContentItem(content: 'M. en A. de N. María Magdalena Saldívar Almorejo'),
                              ContentItem(content: 'Dra. Deni del Carmen Becerril Elías'),
                              ContentItem(content: 'Dr. Ángel Morales González (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Servicio Social',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'Lic. José Francisco Serrano García (invitado,Jefe del Depto de Extensión y Apoyos Educ.)'),
                              ContentItem(content: 'Lic. Heydi Mónica Medrano Ber (invitada, responsable del Servicio Social)'),
                              ContentItem(content: 'Ing. Tania Rodríguez Sarabia (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                              ContentItem(content: 'Ing. Imanol Paz Roldan Chávez (MCSCM)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Cambio Interno de Carrera',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos (invitado)'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'Ing. Erick Fernández Franco (invitado, Jefe del Depto. de Gestión Escolar)'),
                              ContentItem(content: 'Ing. Patricia Escamilla Miranda (ISC)'),
                              ContentItem(content: 'Dr. Ángel Morales González (ISC)'),
                              ContentItem(content: 'Dra. Luz María Sánchez García (IIA)'),
                              ContentItem(content: 'Dra. Maribel Aragón García (IIA)'),
                              ContentItem(content: 'Ing. Tania Rodríguez Sarabia (LCD)'),
                              ContentItem(content: 'M. en E. Mariana Gómez Tress (LCD)'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                              
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Premio a la Excelencia Académica',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'Ing. Erick Fernández Franco (invitado, Jefe del Depto. de Gestión Escolar)'),
                              ContentItem(content: 'Dr. Alfonso Fernández Vázquez (MCSCM)'),
                              ContentItem(content: 'Dra. Maribel Aragón García (IIA)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Cafetería, Barra de Café y Fotocopiado',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretaria: Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'C.P. Gerardo Elias Rodríguez Jaramillo (invitado, Jefe del Depto. de Serv. Mat. y Serv.)'),
                              ContentItem(content: 'Med. Cir. Daniel Mauricio Temozihui Trejo (invitado, Personal de Servicio Médico'),
                              ContentItem(content: 'M. en A.P. María del Rosario Galeana Chávez'),
                              ContentItem(content: 'Dra. Luz María Sánchez García (IIA)'),
                              ContentItem(content: 'C. José Rubén Román Trejo'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              
                            ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Comités',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: 'Becas',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'Lic. José Francisco Serrano García (invitado, Jefe del Depto. de Extensión y Apoyos Educ.)'),
                              ContentItem(content: 'C. Martha Angélica Gasca Cervantes (invitada, responsable de becas)'),
                              ContentItem(content: 'M. en E. Mariana Gómez Tress (LCD)'),
                              ContentItem(content: 'Ing. Patricia Escamilla Miranda (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Seguridad y Contra la Violencia',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario: M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'Coordinador: M. en C. José Asunción Enríquez Zárate'),
                              ContentItem(content: 'Coordinador Suplente: C. Álvaro Olvera Toral (Jefe del Depto. de Servicios Estudiantiles)'),
                              ContentItem(content: 'Enlace con Red de Género: Dra. Ana María Winfield Reyes'),
                              ContentItem(content: 'Enlace con Abogado General: M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'Vocal de TI: M. en D.T.I. Ricardo Ángel Aguilar Pérez (Jefe de la Unidad de Informática)'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'C. Paula Sofía Noguez Ortiz (IIA)'),
                              ContentItem(content: 'Ing. Imanol Paz Roldan Chávez (MCSCM)'),
                              ContentItem(content: 'Ing. Halder Vladimir Galdo Navarro (MCSCM)'),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Procuración de Fondos',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario Técnico: M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'C.P. Patricia Mata Gil (Jefa del Depto. de Rec. Financieros)'),
                              ContentItem(content: 'Dr. Ángel Morales González (ISC)'),
                              ContentItem(content: 'C. José Rubén Román Trejo'),
                              ContentItem(content: 'Abraham Román Ramírez'),
                              ContentItem(content: 'C. Juan Pablo Domínguez Espinoza (LCD)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Austeridad, Transparencia y Rendición de cuentas',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario Técnico: M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'C.P. Patricia Mata Gil (Jefa del Depto. de Rec. Financieros)'),
                              ContentItem(content: 'C.P. Gerardo Elías Rodríguez Jaramillo (Jefe del Depto. de Rec. Mat. y Serv.)'),
                              ContentItem(content: 'M. en E. Mariana Gómez Tress (LCD)'),
                              ContentItem(content: 'C. José Rubén Román Trejo (invitado)'),
                              ContentItem(content: 'C. Abraham Román Ramírez (ISC)'),
                              ContentItem(content: 'C. Zaira Monserrat Díaz Morales (LCD)'),
                              ContentItem(content: 'Ing. Imanol Paz Roldan Chávez (MCSC)'),
                            ],
                        ),
                        const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: 'Ambiental',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(content: 'Presidente: M. en C. Andrés Ortigoza Campos'),
                              ContentItem(content: 'Secretario Técnico: M. en E. Elia Tzindejhé Ramírez Martínez'),
                              ContentItem(content: 'M. en C. Iván Giovanny Mosso García'),
                              ContentItem(content: 'C.P. Gerardo Elías Rodríguez Jaramillo (Jefe del Depto. de Rec. Mat. y Serv.)'),
                              ContentItem(content: 'M. en A.N. Enrique Torres González (invitado, Coordinador de Sustentabilidad)'),
                              ContentItem(content: 'Dra. Maribel Aragón García (IIA)'),
                              ContentItem(content: 'C. José Rubén Román Trejo'),
                              ContentItem(content: 'C. Jessica Guadalupe Olicon Álvarez (IIA)'),
                              ContentItem(content: 'C. Karla Iveth Cid Martínez (ISC)'),
                              ContentItem(content: 'Ing. Halder Vladimir Galdo Navarro (MCSCM)'),
                            ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Reuniones',
                        tamanoTitulo: 24,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Ordinarias',
                        tamanoTitulo: 18,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: '1ra. Ordinaria-08OCT2024',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'Minuta: 1ra. Ordinaria',
                                isLink: true,
                                onTap: () => _launchURL('https://www.escom.ipn.mx/docs/ctce/xxx/minutas/1aReunionOrdinariaXXXCTCE8oct2024.pdf'),
                              ),
                            ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Extraordinarias',
                        tamanoTitulo: 18,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ExpandableContentSection(
                            title: '1ra. Extraordinaria-18OCT2024',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'Minuta: 1ra. Extraordinaria',
                                isLink: true,
                                onTap: () => _launchURL('https://www.escom.ipn.mx/docs/ctce/xxx/minutas/1aReunionExtraordinariaXXXCTCE18oct2024.pdf'),
                              ),
                            ],
                        ),
                          const SizedBox(height: 16),
                          ExpandableContentSection(
                            title: '2da. Extraordinaria-23OCT2024',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'Minuta: 2da. Extraordinaria',
                                isLink: true,
                                onTap: () => _launchURL('https://www.escom.ipn.mx/docs/ctce/xxx/minutas/2aReunionExtraordinariaXXXCTCE23oct2024.pdf'),
                              ),
                            ],
                        ),
                        const SizedBox(height: 16),
                        ExpandableContentSection(
                            title: '3ra. Extraordinaria-4NOV2024',
                            isDarkMode: isDarkMode,
                            items: [
                              ContentItem(
                                content: 'Minuta: 3ra. Extraordinaria',
                                isLink: true,
                                onTap: () => _launchURL('https://www.escom.ipn.mx/docs/ctce/xxx/minutas/3aReunionExtraordinariaXXXCTCE4nov2024.pdf'),
                              ),
                            ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
