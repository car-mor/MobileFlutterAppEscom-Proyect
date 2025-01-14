import 'package:escom_mobile_app/config/menu/menu_items.dart';
import 'package:escom_mobile_app/presentation/providers/alumno_provider.dart';
import 'package:escom_mobile_app/presentation/providers/auth_provider.dart';
import 'package:escom_mobile_app/presentation/screens/home_screen.dart';
import 'package:escom_mobile_app/presentation/screens/student_screen.dart';
import 'package:escom_mobile_app/presentation/screens/teacher_screen.dart';
import 'package:escom_mobile_app/presentation/widgets/titulos_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Student? student;
  const SideMenu({super.key, required this.scaffoldKey, this.student,});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int selectedIndex = -1; // ¿Cuál es la opción seleccionada del menú?
  late final Student student;
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);

    return Drawer(
      child: ListView(
        children: [
          // Enlaces personalizados
          Padding(
            padding: const EdgeInsets.all(1),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Para que los links estén alineados a la izquierda
                children: [
                  Flexible(
                    child: _buildLink(
                      const TitulosHeader(
                        titulo: "Directorio",
                        tituloNegrita: false,
                        tamanoTitulo: 12,
                        tieneFondo: false,
                      ),
                      Uri.parse(
                          'https://www.ipn.mx/directorio-telefonico.html'),
                      context,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: _buildLink(
                      const TitulosHeader(
                        titulo: "Correo",
                        tituloNegrita: false,
                        tamanoTitulo: 12,
                        tieneFondo: false,
                      ),
                      Uri.parse('https://www.ipn.mx/correo-electronico.html'),
                      context,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: _buildLink(
                      const TitulosHeader(
                        titulo: "Calendario",
                        tituloNegrita: false,
                        tamanoTitulo: 12,
                        tieneFondo: false,
                      ),
                      Uri.parse('https://www.ipn.mx/calendario-academico.html'),
                      context,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: _buildLink(
                      const TitulosHeader(
                        titulo: "Buzón",
                        tituloNegrita: false,
                        tamanoTitulo: 12,
                        tieneFondo: false,
                      ),
                      Uri.parse('https://www.ipn.mx/buzon.html'),
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menú con sub-items
          const Divider(),

          // Usamos el filtro de _filterMenuItems aquí
          ..._filterMenuItems(userState).map((item) => _buildMenuItem(item)),
        ],
      ),
    );
  }

  List<MenuItem> _filterMenuItems(UserState userState) {
    if (!userState.isLoggedIn) {
      // Si no está logueado, mostramos solo las opciones públicas
      return appMenuItems;
    } else if (userState.isStudent) {
      // Opciones exclusivas para estudiantes
      return [
        MenuItem(
          title: 'Mi perfil',
          link: '/student_screen',
          icon: Icons.person,
          onTap: (context, ref) {
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentScreen(
                    student: widget.student!, // Usa el student del widget
                  ),
                ),
              );
            }
          },
        ),
        const MenuItem(
            title: 'Horario',
            link: '/horario_alumno_screen',
            icon: Icons.schedule),
        const MenuItem(
            title: 'Calificaciones',
            link: '/calificaciones_screen',
            icon: Icons.grade),
        const MenuItem(
            title: 'ISC 2020', link: '/isc_2020_screen', icon: Icons.book),
        const MenuItem(
            title: 'Profesores', link: '/teachers_screen', icon: Icons.people),
          MenuItem(
  title: 'Cerrar sesión',
  link: '/home_screen',
  icon: Icons.logout,
  onTap: (context, ref) async {
    await ref.read(userProvider.notifier).performLogout();
    
    if (context.mounted) {
      context.go('/home_screen');
    }
    
    if (widget.scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
  },
),
      ];
    } else if (userState.isTeacher) {
      // Opciones exclusivas para profesores
      return [
        const MenuItem(
            title: 'Horario',
            link: '/horario_teacher_screen',
            icon: Icons.schedule),
        const MenuItem(
            title: 'Grupos', link: '/grupos_teacher_screen', icon: Icons.group),
        const MenuItem(
            title: 'Asistencias',
            link: '/assistence_screen',
            icon: Icons.check_circle),
        const MenuItem(
            title: 'Asignar Calificaciones',
            link: '/asignar_calificaciones_screen',
            icon: Icons.edit),
        MenuItem(
          title: 'Cerrar sesión',
          link: '/home_screen',
          icon: Icons.logout,
          onTap: (context, ref) async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();

            ref.read(userProvider.notifier).logOut();
            ref.invalidate(studentInfoProvider);

            if (context.mounted) {
              GoRouter.of(context).go('/home_screen');
            }
          },
        ),
      ];
    }
    return appMenuItems; // En caso de que no sea alumno ni profesor
  }

  Widget _buildMenuItem(MenuItem item) {
    if (item.subItems == null || item.subItems!.isEmpty) {
      // Elemento sin sub-items
      return ListTile(
        leading: _buildIcon(item.icon ?? item.icon2),
        title: Text(
          item.title,
          style: item.link == null
              ? const TextStyle(fontWeight: FontWeight.bold)
              : null,
        ),
        onTap: () {
          if (item.onTap != null) {
            item.onTap!(context, ref);
          } else if (item.link != null) {
            handleMenuItemSelection(item.link, context);
          }
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        selected: appMenuItems.indexOf(item) == selectedIndex,
      );
    } else {
      // Elemento con sub-items
      return ExpansionTile(
        leading: _buildIcon(item.icon ?? item.icon2),
        title: Text(item.title),
        children:
            item.subItems!.map((subItem) => _buildMenuItem(subItem)).toList(),
      );
    }
  }

  Widget _buildIcon(Object? icon) {
    if (icon is IconData) {
      // Si el icono es un IconData, lo mostramos con el widget Icon estándar
      return Icon(icon);
    } else if (icon is FaIcon) {
      // Si el icono es un FaIcon, lo mostramos con el widget FaIcon
      return FaIcon(
          icon.icon); // Usamos .icon para acceder a IconData en FaIcon
    }
    return const SizedBox(); // Si no es ninguno, mostramos un ícono por defecto
  }

  /// Función para manejar la selección de un elemento del menú
  void handleMenuItemSelection(String? link, BuildContext context) async {
    if (link == null) return;

    // Verifica si el enlace es interno o externo
    if (Uri.tryParse(link)?.isAbsolute ?? false) {
      // Enlace externo: abre la URL en el navegador
      final url = Uri.parse(link);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo abrir la URL: $url')),
        );
      }
    } else {
      // Enlace interno: usa GoRouter para navegación
      context.push(link);
    }
  }

  /// Función para construir un enlace personalizado
  Widget _buildLink(Widget tituloWidget, Uri url, BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: tituloWidget, // Renderiza el widget personalizado directamente
    );
  }

  /// Función para abrir un enlace externo
  void _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('No se pudo abrir $url');
    }
  }
}
