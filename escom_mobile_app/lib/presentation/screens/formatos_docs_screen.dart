import 'package:flutter/material.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class FormatosDocsScreen extends ConsumerWidget {

  static const String name = 'formatos_docs_screen';
  const FormatosDocsScreen({super.key});

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
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 14),
                        child: TitulosHeader(
                          titulo: "FORMATOS Y DOCUMENTOS",
                          subtitulo: "Varios",
                          tituloNegrita: true,
                          subtituloNegrita: false,
                          tamanoTitulo: 28,
                          tamanoSubtitulo: 18,
                          tieneFondo: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Add these sections before the existing content
Column(
  children: [
    ExpandableSection(
      title: 'Capital Humano',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Concurso Curricular de Plazas de Carrera 2022',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/slider/recuperacionPlazas_ESCOM2022.pdf'),
        ),
        LinkItem(
          title: 'Justificación de Incidencias',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/dch_incidencias.doc'),
        ),
        LinkItem(
          title: 'Actualización de Datos (Docentes)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/dch_actualizacionDatosDocentes.doc'),
        ),
        LinkItem(
          title: 'Actualización de Datos (PAAE)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/dch_actualizacionDatosPAAE.doc'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Gestión Escolar',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Datos Generales',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_datosGenerales.pdf'),
        ),
        LinkItem(
          title: 'Corrección de Calificación',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_correccionCalificacion.zip'),
        ),
        LinkItem(
          title: 'Solicitud de Reinscripción con 24 Créditos',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_solicitudReinscripcion24Creditos.docx'),
        ),
        LinkItem(
          title: 'Formato de Reinscripción con menos Créditos',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_formatoReinscripcionMenosCreditos.doc'),
        ),
        LinkItem(
          title: 'Solicitud de Dictamen (COSIE-ESCOM)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_solicitudCOSIE-ESCOM.pdf'),
        ),
        LinkItem(
          title: 'Carta de Exposición de Motivos (COSIE-IPN)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_cartaExpMotivosCOSIE-IPN.docx'),
        ),
        LinkItem(
          title: 'Solicitud de Dictamen (COSIE-IPN)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ge_solicitudCOSIE-IPN.pdf'),
        ),
      ],
    ),

    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Recursos Materiales y Servicios',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Entrada de Equipo Personal',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/rmat_entradaEquipoPersonal.pdf'),
        ),
        LinkItem(
          title: 'Entrega de Material',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/rmat_entregaMaterial2025.xlsx'),
        ),
        LinkItem(
          title: 'Orden de trabajo',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/rmat_ordenDeTrabajo.pdf'),
        ),
        LinkItem(
          title: 'Requisición de Compra',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/rmat_requisicionDeCompra2025.xlsx'),
        ),
        LinkItem(
          title: 'RFC del IPN',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/rfcIPN.gif'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Servicio Social',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Registro de SS a distancia dentro de ESCOM',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_registroSS_dentroESCOM_distancia_2021.pdf'),
        ),
        LinkItem(
          title: 'Registro de SS a distancia fuera de ESCOM',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_registroSS_fueraESCOM_distancia_2021.pdf'),
        ),
        LinkItem(
          title: 'Reporte Semanal de SS a distancia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_reporteSemanalSS_distancia_2021.docx'),
        ),
        LinkItem(
          title: ' Reporte Mensual de SS a distancia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_reporteMensualSS_distancia_2021.docx'),
        ),
        LinkItem(
          title: ' Reporte Global de SS a distancia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_reporteGlobalSS_distancia_2021.docx'),
        ),
        LinkItem(
          title: 'Evaluación Final de SS',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_formatoEvalFinal2019.pdf'),
        ),
        LinkItem(
          title: 'Liberación de SS a distancia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/ss_liberacionSS_distancia_2021.pdf'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Subdirección Académica',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Formato de Minutas de Reuniones de Academia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_formatoMinutasReunionesAcademia.docx'),
        ),
        LinkItem(
          title: 'Formato de Lista de Asistencia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_formatoListaAsistenciaReunionesAcademia.docx'),
        ),
        LinkItem(
          title: 'Reporte de Término de Estancia Profesional',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_reporteFinalEstanciaProfesional.docx'),
        ),
        LinkItem(
          title: 'Solicitud de Acceso a Instalaciones de la ESCOM en Periodo Vacacional para TT',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_accesoVacacionesTT.docx'),
        ),
        LinkItem(
          title: 'Solicitud de UA Optativa Externa',
          onTap: () => _launchURL('https://www.escom.ipn.mx/images/escomunidad/sacad/op_externas.jpg'),
        ),
        LinkItem(
          title: 'Solicitud de UA Electiva Externa',
          onTap: () => _launchURL('https://www.escom.ipn.mx/images/escomunidad/sacad/op_externas.jpg'),
        ),
        LinkItem(
          title: 'Solicitud de Evaluación de Saberes Previamente Adquiridos',
          onTap: () => _launchURL('https://www.escom.ipn.mx/images/escomunidad/sacad/saberes.jpeg'),
        ),
        
        LinkItem(
          title: 'Solicitud para realizar Acciones de Flexibilidad Académica',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_flexibilidadAcademica.zip'),
        ),
        
        LinkItem(
          title: 'Actividades Complementarias (Docentes)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_actvsComplementariasDocente.doc'),
        ),
        
        LinkItem(
          title: 'Actividades Complementarias (Tec. Docentes)',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_actvsComplementariasTecDocente.doc'),
        ),
        
        LinkItem(
          title: 'Estructura Educativa',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_estructuraEducativa.doc'),
        ),
        
        LinkItem(
          title: 'Seguimiento Programático',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_formatoSeguimProgramatico.doc'),
        ),
        
        LinkItem(
          title: 'Informe Semestral de Academia',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_informeSemestralAcademia.doc'),
        ),
        
        LinkItem(
          title: 'Planeaciín Didáctica',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_planeacionDidactica.docx'),
        ),
        
        LinkItem(
          title: 'Programa de Estudios Certificado',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_programaEstudiosCertificado.pdf'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'U.I Protección Civil',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Presentación Sem. 2025-1',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/proteccion_civil_25_1.pdf'),
        ),
        LinkItem(
          title: 'Sismos - Folleto',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/uipc_folletoSismos.pdf'),
        ),
        LinkItem(
          title: 'Sismos - Infografía',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/uipc_infografiaSismos.pdf'),
        ),
        LinkItem(
          title: 'Incendios y Tornados',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/uipc_incendiosTornados.pdf'),
        ),
        LinkItem(
          title: 'Escuela Nacional de Protección Civil - SEGOB',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/uipc_escuelaNacionalProteccionCivilSEGOB.pdf'),
        ),
        LinkItem(
          title: 'Evaluación de la Seguridad Estructural de Edificios - SEGOB',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/uipc_evaluacionSeguridadEstructuralSEGOB.pdf'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Varios',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Manual de Procedimientos ESCOM',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/var_maualProcedimientosESCOM2013.pdf'),
        ),
        LinkItem(
          title: 'Formato de Validación de Estancias Profesionales',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/var_formatoValidacionEstanciaProfesional.doc'),
        ),
        LinkItem(
          title: 'Formato de Afiliación al IMSS',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/var_afiliacionIMSS.doc'),
        ),
        LinkItem(
          title: 'Conformidad de uso de locker',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/conformidadUsoLocker_25_1.pdf'),
        ),
      ],
    ),
    const SizedBox(height: 16),
    ExpandableSection(
      title: 'Proyectos de Investigación',
      isDarkMode: isDarkMode,
      items: [
        LinkItem(
          title: 'Presentación. Proyectos de Investigación 2023',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/var_proyectosDeInvestigacion2023.pdf'),
        ),
        LinkItem(
          title: 'Formatos. Proyectos de Investigación 2023',
          onTap: () => _launchURL('https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/var_formatosProyectosDeInvestigacion2023.zip'),
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