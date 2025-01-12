import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter/material.dart' show IconData; es lo ideal para que no se importe todo el paquete, pero ya se ha importado en el main.dart

class MenuItem {
  final String title;
  final String? link;
  final IconData? icon;
  final FaIcon? icon2;
  final List<MenuItem>? subItems;
  final bool Function(UserState)? shouldShow;

  const MenuItem({
    required this.title,
    this.link,
    this.icon,
    this.icon2,
    this.subItems,
    this.shouldShow,
  });
}

const List<MenuItem> appMenuItems = <MenuItem>[
  // MenuItem(
  //   title: 'Mi perfil',
  //   subTitle: 'Introducción a riverpod',
  //   link: '/student_screen',
  //   icon: Icons.person
  // ),
  MenuItem(title: 'Inicio', link: '/home_screen', icon: Icons.home),

  MenuItem(
    title: 'Conócenos',
    icon: Icons.info,
    subItems: [
      MenuItem(
        title: 'Consejo Técnico Consultivo Escolar',
        link: '/consejo_tecnico_screen',
      ),
      MenuItem(
        title: 'Directorio',
        link: '/organigrama_screen',
      ),
      MenuItem(
        title: 'Historia/Escudo',
        link: '/history_screen',
      ),
      MenuItem(
        title: 'Misión/Visión',
        link: '/mission_vission_screen',
      ),
      MenuItem(
        title: 'Organigrama',
        link: '/organigrama_screen',
      ),
      MenuItem(
        title: 'Transparencia',
        link: '/transparency_screen',
      ),
      MenuItem(
        title: 'Posgrado',
        link: '/posgrado_screen',
      ),
      MenuItem(
        title: 'SSEIS',
        subItems: [
          MenuItem(
            title: 'Academias',
            link: '/academies_screen',
            icon: Icons.computer,
          ),
          MenuItem(
            title: 'Buzón de denuncias',
            link: '/denunciations_screen',
            icon2: FaIcon(FontAwesomeIcons.eye),
          ),
          MenuItem(
            title: 'COSECOVI',
            link: '/cosecovi_screen',
            icon2: FaIcon(FontAwesomeIcons.shield),
          ),
        ],
        
      ),
      MenuItem(
        title: 'Ubicación',
        link: '/location_screen',
      ),
    ],
  ),

  MenuItem(
    title: 'Oferta educativa',
    link: '/academic_offer_screen',
    icon: Icons.school,
    subItems: [
      MenuItem(
        title: 'Ing. en Sistemas Computacionales',
        link: '/isc_screen',
        subItems: [
          MenuItem(
            title: 'Plan 2020',
            link: '/isc_2020_screen',
          ),
          MenuItem(
            title: 'Plan 2009',
            link: '/isc_2009_screen',
          ),
        ],
      ),
      MenuItem(
        title: 'Ing. en Inteligencia Artificial',
        link: '/ia_screen',
      ),
      MenuItem(
        title: 'Lic. en Ciencia de Datos',
        link: '/lcd_screen',
      ),
       MenuItem(
        title: 'Ing. en Sistemas Automotrices',
        link: '/isa_screen',
      ),
      //ERROR NOT FOUND en página oficial de ESCOM
      // MenuItem(
      //   title: 'M. en C. en Sistemas Computacionales Móviles',
      //   link: '/mscm_screen',
      // ),
      // MenuItem(
      //   title:
      //       'M. en C. y Doctorado en Inteligencia Artificial y Ciencia de Datos',
      //   link: '/mdiacd_screen',
      // ),
    ],
  ),
  MenuItem(
  title: 'Escomunidad', 
  link: '/community_screen', 
  icon: Icons.people,
    subItems: [
      MenuItem(
        title: 'Estudiantes',
      ),
      MenuItem(
        title: 'Actividades culturales',
        link: '/cultural_activities_screen',
      ),
      MenuItem(
        title: 'Actividades deportivas',
        link: '/sports_screen',
      ),
      MenuItem(
        title: 'Becas',
        link: '/becas_screen',
      ),
      MenuItem(
        title: 'Biblioteca',
        link: '/biblioteca_screen',
      ),
      MenuItem(
        title: 'Cambio de carrera',
        link: 'https://www.ipn.mx/dae/',
      ),
      MenuItem(
        title: 'Clubs',
        link: '/clubs_screen',
        ),
      MenuItem(
        title: 'Clubs(registro)',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_procedimientoClubes_2022.pdf',
      ),
      MenuItem(
        title: 'COSIE',
        link: '/cosie_screen',
      ),
      MenuItem(
        title: 'Justificante médico',
        link: 'https://docs.google.com/forms/d/e/1FAIpQLSdA5w0hig1SviBkxWsH19wqd4wiqDpyD9bgy4fOANAkIuMHkw/viewform',
      ),
      MenuItem(
        title: 'Material didáctico',
        link: '/material_didactico_screen',
      ),
      MenuItem(
        title: 'Movilidad',
        link: '/movilidad_screen',
        ),   
      MenuItem(
        title: 'Poliemprende',
        link: '/poliemprende_screen',
      ),
      MenuItem(
        title: 'Servicio social',
        link: '/servicio_social_screen',
      ),
      MenuItem(
        title: 'Servicios de salud',
        link: '/servicios_salud_screen',
      ),
      MenuItem(
        title: 'Trabajos terminales',
        link: '/trabajos_terminales_screen',
      ),

      //Su url es no seguro y manda a imagen de logos
      // MenuItem(
      //   title: 'UA electiva',
      //   link: '',
      // ),
      
      //ERROR NOT FOUND en página oficial de ESCOM
      // MenuItem(
      //   title: 'Reporte de término de estancia profesional',
      //   link: '',
      //   ),
      MenuItem(
        title: 'Recuperación de tiempo en labs. de electrónica',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_procTiempoRecuperacionLabsElectronica.pdf',
      ),
      MenuItem(
        title: 'Solicitud para apertura de grupo',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_procSolAperturaGrupo.pdf',
      ),
      MenuItem(
        title: 'Horarios de labs. de cómputo',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/udi_horariosLabsComputo.pdf',
      ),
      MenuItem(
        title: 'Egresados',
      ),
      MenuItem(
        title: 'Bolsa de trabajo',
        link: '/bolsa_trabajo_screen',
        ),   
      MenuItem(
        title: 'Galería de toma de protesta',
        link: '/galeria_toma_protesta_screen',
      ),
      MenuItem( //Se repite en la sección de ESCOMUNIDAD
        title: 'Servicio social',
        link: '/servicio_social_screen',
      ),
      MenuItem(
        title: 'Titulación',
        link: '/titulacion_screen',
      ),
      MenuItem(
        title: 'Título y cédula profesional',
        link: 'https://www.ipn.mx/dae/',
      ),
      
//Su url es no seguro y manda a imagen de logos (se repite)
      // MenuItem(
      //   title: 'UA electiva',
      //   link: '',
      // ),
      MenuItem(
        title: 'Docentes / PAAE',
      ),
      MenuItem(
        title: 'Becas',
        link: 'https://sad.ipn.mx/',
      ),
      MenuItem(
        title: 'Desarrollo profesional',
        link: 'https://www.ipn.mx/dfie/',
      ),
      MenuItem(
        title: 'Producción de recursos didácticos digitales',
        link: 'https://www.ipn.mx/dev/servicios/evaluacion-rdd.html',
      ),
      MenuItem(
        title: 'Propiedad intelectual',
        link: '/propiedad_intelectual_screen',
        ),   
      MenuItem(
        title: 'Trámites, servicios y prestaciones',
        link: 'https://www.ipn.mx/dch/',
      ),
      MenuItem(
        title: 'Unidades de aprendizaje impartidas por docentes',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/sacad_uasImpartidasXDocentes.pdf',
      ),
      //ERROR NOT FOUND en página oficial de ESCOM
      // MenuItem(
      //   title: 'Validación de docs. y material educativo',
      //   link: '',
      // ),
      MenuItem(
        title: 'Varios',
      ),
      MenuItem(
        title: 'Aviso de privacidad CCTV',
        link: 'https://www.escom.ipn.mx/docs/escomunidad/formatosDocumentos/avisoPrivacidadCCTV2020.pdf',
        ),
      MenuItem(
        title: 'Defensora de derechos politécnicos',
        link: 'https://www.ipn.mx/defensoria/',
      ),
      //ERROR NOT FOUND en página oficial de ESCOM
      // MenuItem(
      //   title: 'Donativos en especie',
      //   link: '',
      // ),
      MenuItem(
        title: 'Elección de ternas',
        link: '/eleccion_ternas_screen',
      ),
      MenuItem(
        title: 'Formatos / documentos',
        link: '/formatos_docs_screen',
      ),
      MenuItem(
        title: 'Normatividad institucional',
        link: 'https://www.ipn.mx/normatividad/',
        ),
     
      //Es la misma que formatos y documentos en la página oficial de ESCOM
      // MenuItem(
      //   title: 'Protección civil',
      //   link: '',
      // ),
      MenuItem(
        title: 'Sustentabilidad',
        link: '/sustentabilidad_screen',
      ),
      //ERROR NOT FOUND en página oficial de ESCOM
      // MenuItem(
      //   title: 'Informe anual dirección 2023',
      //   link: '',
      //   ),        
    ],
  ),

  MenuItem(
    title: 'SGOE',
    link: '/legal_framework_screen',
    icon: Icons.gavel,
    subItems: [
      MenuItem(
        title: 'Misión & Visión & Política',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/misionVisionPoliticaSGOE.pdf',
      ),
      MenuItem(
        title: 'Manual del SGOE',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/manualSGOE.pdf',
      ),
      MenuItem(
        title: 'Mapa de procesos',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/mapaProcesosSGOE.pdf',
      ),
      MenuItem(
        title: 'Gestores & enlaces',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/gestoresEnlacesSGOE.pdf',
      ),
      MenuItem(
        title: 'Manual de organización',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/manualOrganizacionESCOM_2023.pdf',
      ),
      MenuItem(
        title: 'Manual de procedimientos',
        link: 'https://www.escom.ipn.mx/docs/otros/sgoe/manualProcedimientosESCOM_2023.pdf',
      ),
      MenuItem(
        title: 'Quejas & sugerencias & felicitaciones',
        link: 'https://docs.google.com/forms/d/e/1FAIpQLSeKJB_Nf88p_W_oaOoimTOEBvRKYQ48JrPUECAvfsvE0I001w/viewform',
      ),
    ],
  ),

  MenuItem(
      title: 'Red de género',
      link: '/gender_network_screen',
      icon2: FaIcon(FontAwesomeIcons.users),
),

  MenuItem(
      title: 'Redes sociales', 
      icon: Icons.share,
      subItems: [
      MenuItem(
        title: 'escomipnmx',
        link: 'https://www.facebook.com/escomipnmx/',
        icon: Icons.facebook,
      ),
      MenuItem(
        title: 'escomunidad',
        link: 'https://twitter.com/escomunidad/',
        icon2: FaIcon(FontAwesomeIcons.twitter),
      ),
      MenuItem(
        title: 'Depto. FBásica',
        link: 'https://www.facebook.com/DepartamentoBasicasEscom',
        icon: Icons.facebook,
      ),
      MenuItem(
        title: 'Becas ESCOM',
        link: 'https://www.facebook.com/BecasEscom/',
        icon: Icons.facebook,
      ),
      MenuItem(
        title: 'Servicio Social ESCOM',
        link: 'https://www.facebook.com/ssescom/',
        icon: Icons.facebook,
      ),
      MenuItem(
        title: 'Red de Género ESCOM',
        link: 'https://www.facebook.com/redgeneroescom/',
        icon: Icons.facebook,
      ),
      MenuItem(
        title: 'Bolsa de Trabajo ESCOM',
        link: 'https://www.facebook.com/bolsaescom/',
        icon: Icons.facebook,
      ),
    ],
      ),


MenuItem(
      title: 'Profesores',
      link: '/teachers_screen',
      icon2: FaIcon(FontAwesomeIcons.chalkboardUser),

  ),

  MenuItem(
      title: 'Galería de imágenes',
      link: '/infinite_scroll_screen',
      icon: Icons.image),

  MenuItem(
     title: 'Licencias',
     link: '/licenses_screen',
     icon: Icons.document_scanner),

  MenuItem(
     title: 'Iniciar sesión',
     link: '/login_screen',
     icon: Icons.login),
];
