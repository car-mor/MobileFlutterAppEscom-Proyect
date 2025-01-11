import 'package:escom_mobile_app/config/menu/menu_items.dart';
import 'package:escom_mobile_app/presentation/widgets/titulos_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget { 

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int selectedIndex = -1; //Cual es la opcion seleccionada del menú

  @override
  Widget build(BuildContext context) {

    
    return Drawer(
      child: ListView(
        children: [
          // Enlaces personalizados
          Padding(
            padding: const EdgeInsets.all(1),
            child: Center(
              //padding: EdgeInsets.fromLTRB(14, hasNotch ? 0 : 10, 10, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Para que los links estén alineados a la izquierda
                children: [
                  Flexible(
                    child: _buildLink(
            const TitulosHeader(
              titulo: "Directorio",
              tituloNegrita: false,
              tamanoTitulo: 12,
              tieneFondo: false,
            ),
            Uri.parse('https://www.ipn.mx/directorio-telefonico.html'), 
            context
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
            context
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
            context
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
            context
                    ),
                  ),
                ],
              ),
            ),
          ),


          // Menú con sub-items
          const Divider(),
          ...appMenuItems.map((item) => _buildMenuItem(item)),
        ],
      ),
    );
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
        handleMenuItemSelection(item.link, context);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selected: appMenuItems.indexOf(item) == selectedIndex,
    );
  } else {
    // Elemento con sub-items
    return ExpansionTile(
      leading: _buildIcon(item.icon ?? item.icon2),
      title: Text(
        item.title,
        style: null, // No aplica negritas para elementos con sub-items
      ),
      children: item.subItems!
          .map((subItem) => _buildMenuItem(subItem))
          .toList(),
    );
  }
}



  Widget _buildIcon(Object? icon) {
  if (icon is IconData) {
    // Si el icono es un IconData, lo mostramos con el widget Icon estándar
    return Icon(icon);
  } else if (icon is FaIcon) {
    // Si el icono es un FaIcon, lo mostramos con el widget FaIcon
    return FaIcon(icon.icon); // Usamos .icon para acceder a IconData en FaIcon
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
    
  }

  /// Función para construir un enlace personalizado
 Widget _buildLink(Widget tituloWidget, Uri url, BuildContext context) {
  return InkWell(
    onTap: () => _launchURL(url, context),
    child: tituloWidget, // Renderiza el widget personalizado directamente
  );
}

  /// Función para abrir un enlace externo
  Future<void> _launchURL(Uri url, BuildContext context) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir la URL: $url')),
      );
    }

    
  }


