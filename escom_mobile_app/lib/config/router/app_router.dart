//import 'package:escom_mobile_app/config/theme/app_theme.dart';
import 'package:escom_mobile_app/presentation/screens/screens.dart';
import 'package:escom_mobile_app/screens/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:escom_mobile_app/screens/users_screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/app_tutorial_screen',
  routes: [
    GoRoute(
      path: '/home_page',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),

     GoRoute(
      path: '/app_tutorial_screen',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),

    GoRoute(
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/login_screen',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/student_screen/:studentId',
      name: StudentScreen.name,
      builder: (context, state) => const StudentScreen(),
    ),

    GoRoute(
      path: '/consejo_tecnico_screen',
      name: ConsejoTecnicoScreen.name,
      builder: (context, state) => const ConsejoTecnicoScreen(),
    ),
    GoRoute(
      path: '/directory_screen',
      name: DirectoryScreen.name,
      builder: (context, state) => const DirectoryScreen(),
    ),
    GoRoute(
      path: '/history_screen',
      name: HistoryScreen.name,
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/mission_vission_screen',
      name: MissionVissionScreen.name,
      builder: (context, state) => const MissionVissionScreen(),
    ),
     GoRoute(
      path: '/organigrama_screen',
      name: OrganigramaScreen.name,
      builder: (context, state) => const OrganigramaScreen(),
    ),
   GoRoute(
      path: '/transparency_screen',
      name: TransparencyScreen.name,
      builder: (context, state) => const TransparencyScreen(),
    ),
    GoRoute(
      path: '/posgrado_screen',
      name: PosgradoScreen.name,
      builder: (context, state) => const PosgradoScreen(),
    ),
     GoRoute(
      path: '/academies_screen',
      name: AcademiesScreen.name,
      builder: (context, state) => const AcademiesScreen(),
    ),
    GoRoute(
      path: '/denunciations_screen',
      name: DenunciationsScreen.name,
      builder: (context, state) => const DenunciationsScreen(),
    ),
    GoRoute(
      path: '/cosecovi_screen',
      name: COSECOVIScreen.name,
      builder: (context, state) => const COSECOVIScreen(),
    ),
 GoRoute(
      path: '/location_screen',
      name: LocationScreen.name,
      builder: (context, state) => const LocationScreen(),
    ),

   GoRoute(
      path: '/isc_2020_screen',
      name:ISC2020Screen.name,
      builder: (context, state) => const ISC2020Screen(),
    ),
    GoRoute(
      path: '/isc_2009_screen',
      name:ISC2009Screen.name,
      builder: (context, state) => const ISC2009Screen(),
    ),
    GoRoute(
      path: '/ia_screen',
      name:IAScreen.name,
      builder: (context, state) => const IAScreen(),
    ),
    GoRoute(
      path: '/lcd_screen',
      name:LCDScreen.name,
      builder: (context, state) => const LCDScreen(),
    ),
     GoRoute(
      path: '/isa_screen',
      name:ISAScreen.name,
      builder: (context, state) => const ISAScreen(),
    ),
     GoRoute(
      path: '/cultural_activities_screen',
      name:CulturalActivitiesScreen.name,
      builder: (context, state) => const CulturalActivitiesScreen(),
    ),
    GoRoute(
      path: '/sports_screen',
      name:SportsScreen.name,
      builder: (context, state) => const SportsScreen(),
    ),
    GoRoute(
      path: '/becas_screen',
      name: BecasScreen.name,
      builder: (context, state) => const BecasScreen(),
    ),
    GoRoute(
      path: '/biblioteca_screen',
      name: BibliotecaScreen.name,
      builder: (context, state) => const BibliotecaScreen(),
    ),
    GoRoute(
      path: '/clubs_screen',
      name: ClubsScreen.name,
      builder: (context, state) => const ClubsScreen(),
    ),
    GoRoute(
      path: '/cosie_screen',
      name: COSIEScreen.name,
      builder: (context, state) => const COSIEScreen(),
    ),
    GoRoute(
      path: '/material_didactico_screen',
      name: MaterialDidacticoScreen.name,
      builder: (context, state) => const MaterialDidacticoScreen(),
    ),
     GoRoute(
      path: '/movilidad_screen',
      name: MovilidadScreen.name,
      builder: (context, state) => const MovilidadScreen(),
    ),
    GoRoute(
      path: '/poliemprende_screen',
      name: PoliemprendeScreen.name,
      builder: (context, state) => const PoliemprendeScreen(),
    ),
    GoRoute(
      path: '/servicio_social_screen',
      name: ServicioSocialScreen.name,
      builder: (context, state) => const ServicioSocialScreen(),
    ),
    GoRoute(
      path: '/servicios_salud_screen',
      name: ServiciosSaludScreen.name,
      builder: (context, state) => const ServiciosSaludScreen(),
    ),
     GoRoute(
      path: '/trabajos_terminales_screen',
      name: TrabajosTerminalesScreen.name,
      builder: (context, state) => const TrabajosTerminalesScreen(),
    ),
     GoRoute(
      path: '/bolsa_trabajo_screen',
      name: BolsaTrabajoScreen.name,
      builder: (context, state) => const BolsaTrabajoScreen(),
    ),
     GoRoute(
      path: '/galeria_toma_protesta_screen',
      name: GaleriaTomaProtestaScreen.name,
      builder: (context, state) => const GaleriaTomaProtestaScreen(),
    ),
    GoRoute(
      path: '/titulacion_screen',
      name: TitulacionScreen.name,
      builder: (context, state) => const TitulacionScreen(),
    ),
    GoRoute(
      path: '/propiedad_intelectual_screen',
      name: PropiedadIntelectualScreen.name,
      builder: (context, state) => const PropiedadIntelectualScreen(),
    ),
  GoRoute(
      path: '/eleccion_ternas_screen',
      name:EleccionTernasScreen.name,
      builder: (context, state) => const EleccionTernasScreen(),
    ),
 GoRoute(
      path: '/formatos_docs_screen',
      name: FormatosDocsScreen.name,
      builder: (context, state) => const FormatosDocsScreen(),
    ),
GoRoute(
      path: '/susentabilidad_screen',
      name: SustentabilidadScreen.name,
      builder: (context, state) => const SustentabilidadScreen(),
    ),

    GoRoute(
      path: '/teachers_screen',
      name: TeachersScreen.name,
      builder: (context, state) => const TeachersScreen(),
    ),

    GoRoute(
      path: '/infinite_scroll_screen',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/licenses_screen',
      name: LicensesScreen.name,
      builder: (context, state) => const LicensesScreen(),
    ),
  ],
);
