import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TitulacionScreen extends ConsumerWidget {
  static const String name = 'titulacion_screen';
  const TitulacionScreen({super.key});

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
    /*final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: isDarkMode ? Colors.white : Colors.black87,
        );*/

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
                                'Titulación',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Calendario de Sesiones informativas',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/titulacion.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/images/titulacion2.png',
                            //width: 350, // Ancho de la imagen
                            //height: 350, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Estimado egresado y egresada:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Antes de iniciar el trámite de Acta de Examen Profesional, debes elegir alguna de las diferentes formas de titulación que ofrece la ESCOM:',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Modalidades de titulación*:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'I.- Curricular',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFAcbd_b90/view?utm_content=DAFAcbd_b90&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelin'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'II.- Por escolaridad',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFAcZiBktc/D4xWOUYvOQMCEWf-jpPstg/view?utm_content=DAFAcZiBktc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'III.- Créditos de posgrado',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFAcIw2nOs/39iW05VaKUnYpfO3U4tp7w/view?utm_content=DAFAcIw2nOs&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'IV.- Memoria de experiencia profesional',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFAb3rzk_4/Ckb0r3SmcujSQWjcyXu8EQ/view?utm_content=DAFAb3rzk_4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'V.- Trabajo de investigación',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAE_8dfd9nU/uwW9KuLADVRNLdRrRRx9cg/view?utm_content=DAE_8dfd9nU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'VI.- Tesis',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFAb0nSxAc/s86eIZXo8jq83Vi-F-S7BA/view?utm_content=DAFAb0nSxAc&utm_campaign=designshare&utm_medium=link&utm_source=homepage_design_menu'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'VII. Examen de conocimientos por áreas',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFyH6l6HDE/EZ5dJm-3z0FlgKZqi7AeTw/view?utm_content=DAFyH6l6HDE&utm_campaign=designshare&utm_medium=link&utm_source=editor'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'VIII. Seminario de tesis',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFM5nnTOyQ/fdPqFrB3f4VDGt6TPOe_jw/view?utm_content=DAFM5nnTOyQ&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink#1'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'IX. Práctica Profesional',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.canva.com/design/DAFzh1_rer0/4GE3ODFL4640T5cJb5D9MA/view?utm_content=DAFzh1_rer0&utm_campaign=designshare&utm_medium=link&utm_source=editor'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8),
                            Text('Más info', 
                            style: TextStyle(color: Colors.teal, fontSize: 17), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '*Cabe señalar que son las modalidades de titulación más comunes.',
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Para tramitar el Acta de Examen Profesional debes de contar con los siguientes documentos:',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: '• Carta de pasante',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'El trámite se realiza en la siguiente liga. Para tramitarla requieres la boleta global certificada (emitida por Gestión Escolar)',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => _launchURL('https://www.sicert.ipn.mx/plataforma/login.aspx'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('https://www.sicert.ipn.mx/plataforma/login.aspx', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const TitulosHeader(
                        titulo: '• Certificado total de estudios',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'El trámite se realiza en la siguiente liga. Para tramitarla requieres la boleta global certificada (emitida por Gestión Escolar)',
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => _launchURL('https://www.sicert.ipn.mx/plataforma/login.aspx'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('https://www.sicert.ipn.mx/plataforma/login.aspx', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const TitulosHeader(
                        titulo: '• Constancia del dominio inglés (nivel B2)',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tipos de validación:\n1. Aprobar nivel Avanzado 5 en CELEX o CENLEX del IPN\n2. Examen de 4 habilidades nivel B2\n3. Certificado Cambridge, previa validación en:',
                        textAlign: TextAlign.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://docs.google.com/forms/d/e/1FAIpQLScgDCCQvpQasxMBjv7mJ1A6fcsBQ1ldeBqhneaPP2BHZLxIUw/viewform'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Aquí mismo', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const Text(
                        '4. TOEFL ITP (puntuación de 543 a 626 puntos), previa validación en:',
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://docs.google.com/forms/d/e/1FAIpQLScgDCCQvpQasxMBjv7mJ1A6fcsBQ1ldeBqhneaPP2BHZLxIUw/viewform'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Aquí mismo', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const TitulosHeader(
                        titulo: '• Constancia de liberación de servicio social',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Versión impresa (año 2019 o previo) o versión digital (2020 o posterior)',
                        textAlign: TextAlign.start,
                      ),
                      const TitulosHeader(
                        titulo: '• Carta responsiva de Trabajo Terminal',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Documento emitido por la Comisión Académica de Trabajos Terminales. Ejemplos en:',
                        textAlign: TextAlign.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://drive.google.com/file/d/11lU8n55zz52As71Cmv8q9AHJ-p3CLsR-/view?usp=sharing'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('Aquí mismo', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Si ya cuentas con todos los documentos, envíalos en un solo documento en formato PDF al correo ext_ae_escom@ipn.mx para que el área de Titulación te informe acerca del trámite',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      const SizedBox(height: 20),
                      const TitulosHeader(
                        titulo: 'Si ya cuentas con tu Acta de Examen Profesional, puedes realizar el trámite de tu título en: ',
                        tamanoTitulo: 17,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      InkWell(
                        onTap: () => _launchURL('https://www.sicert.ipn.mx/'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            Text('https://www.sicert.ipn.mx/', 
                            style: TextStyle(color: Colors.teal, fontSize: 16), selectionColor: Color.fromARGB(255, 115, 0, 150)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                                'Informes:',
                                style: TextStyle(
                                color: Color.fromRGBO(23, 162, 184, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                        ),
                        const TitulosHeader(
                        titulo: 'Lic. José Francisco Serrano García',
                        tamanoTitulo: 20,
                        tituloNegrita: true,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, size: 16),
                          SizedBox(width: 8),
                          Text('Tel. 5557296000 Ext. 52056'),
                        ],
                      ),
                      const SizedBox(height: 8), 
                      const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.envelope, size: 16),
                            SizedBox(width: 8),
                            Text('ext_ae_escom@ipn.mx'),
                          ],
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