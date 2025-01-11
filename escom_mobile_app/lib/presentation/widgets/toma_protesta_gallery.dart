import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/titulos_header.dart';

class ImageGallery extends ConsumerWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkmode;

    final List<List<String>> images = [
      [
        'assets/images/tomas_protesta_gallery/220219_1.jpg',
        'assets/images/tomas_protesta_gallery/220219_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/080219_1.jpg',
        'assets/images/tomas_protesta_gallery/080219_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/250119_1.jpg',
        'assets/images/tomas_protesta_gallery/250119_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/201218_1.jpg',
        'assets/images/tomas_protesta_gallery/201218_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/131218_1.jpg',
        'assets/images/tomas_protesta_gallery/131218_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/231118_1.jpg',
        'assets/images/tomas_protesta_gallery/231118_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/261018_1.jpg',
        'assets/images/tomas_protesta_gallery/261018_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/051018_1.jpg',
        'assets/images/tomas_protesta_gallery/051018_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/070918_1.jpg',
        'assets/images/tomas_protesta_gallery/070918_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/240818_1.jpg',
        'assets/images/tomas_protesta_gallery/240818_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/290618_1.jpg',
        'assets/images/tomas_protesta_gallery/290618_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/200418_1.jpg',
        'assets/images/tomas_protesta_gallery/200418_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/230318_1.jpg',
        'assets/images/tomas_protesta_gallery/230318_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/230218_1.jpg',
        'assets/images/tomas_protesta_gallery/230218_2.jpg',
      ],
      [
        'assets/images/tomas_protesta_gallery/190118_1.jpg',
        'assets/images/tomas_protesta_gallery/190118_2.jpg',
      ],
    ];

    final selectedButtonIndex = ref.watch(_selectedButtonIndexProvider);
    final selectedImageIndex = ref.watch(_selectedImageIndexProvider);

    // Lista combinada para el botón "Todas".
    final allImages = images.expand((group) => group).toList();
    final List<Map<String, dynamic>> buttonData = [
      // {'titulo': 'Todas', 'subtitulo': 'Ver todas las imágenes'},
      {'titulo': 'Todas'},
      {'titulo': '22/02/2019'},
      {'titulo': '08/02/2019'},
      {'titulo': '25/01/2019'},
      {'titulo': '20/12/2018'},
      {'titulo': '13/12/2018'},
      {'titulo': '23/11/2018'},
      {'titulo': '26/10/2018'},
      {'titulo': '05/10/2018'},
      {'titulo': '07/09/2018'},
      {'titulo': '24/08/2018'},
      {'titulo': '29/06/2018'},
      {'titulo': '20/04/2018'},
      {'titulo': '23/03/2018'},
      {'titulo': '23/02/2018'},
      {'titulo': '19/01/2018'},
      // Agrega más elementos según sea necesario
    ];

    final List<Map<String, dynamic>> imagesData = [
      // {'titulo': 'Todas', 'subtitulo': 'Ver todas las imágenes'},
      // {'titulo': 'Todas'},
      {'titulo': '22 de Diciembre de 2019'},
      {'titulo': '22 de Diciembre de 2019'},
      {'titulo': '08 de Febrero de 2019'},
      {'titulo': '08 de Febrero de 2019'},
      {'titulo': '25 de Enero de 2019'},
      {'titulo': '25 de Enero de 2019'},
      {'titulo': '20 de Diciembre de 2018'},
      {'titulo': '20 de Diciembre de 2018'},
      {'titulo': '13 de Diciembre de 2018'},
      {'titulo': '13 de Diciembre de 2018'},
      {'titulo': '23 de Noviembre de 2018'},
      {'titulo': '23 de Noviembre de 2018'},
      {'titulo': '26 de Octubre de 2018'},
      {'titulo': '26 de Octubre de 2018'},
      {'titulo': '05 de Octubre de 2018'},
      {'titulo': '05 de Octubre de 2018'},
      {'titulo': '07 de Septiembre de 2018'},
      {'titulo': '07 de Septiembre de 2018'},
      {'titulo': '24 de Ocutbre de 2018'},
      {'titulo': '24 de Ocutbre de 2018'},
      {'titulo': '29 de Junio de 2018'},
      {'titulo': '29 de Junio de 2018'},
      {'titulo': '20 de Abril de 2018'},
      {'titulo': '20 de Abril de 2018'},
      {'titulo': '23 de Marzo de 2018'},
      {'titulo': '23 de Marzo de 2018'},
      {'titulo': '23 de Febrero de 2018'},
      {'titulo': '23 de Febrero de 2018'},
      {'titulo': '19 de Enero de 2018'},
      {'titulo': '19 de Enero de 2018'},
      // Agrega más elementos según sea necesario
    ];

    return Column(
      children: [

        // Lista de datos para los botones

        // Botones (organizados en dos columnas, centrados)
       Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Espacio horizontal entre el Wrap y los bordes de la pantalla
          child: Wrap(
            spacing: 10.0, // Espaciado horizontal entre los botones
            runSpacing: 4.0, // Espaciado vertical entre los botones
            alignment: WrapAlignment.center, // Centra los botones
            children: List.generate(images.length + 1, (index) {
              final isAllButton = index == 0; // Primer botón es "Todas"
              return SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 10, // Reduce el tamaño proporcional al nuevo padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40), 
                    elevation: 0, // Elimina la sombra
                    shadowColor: Colors.transparent, // Elimina el color de la sombra
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Más espacio entre el texto y el borde
                    backgroundColor: selectedButtonIndex == (isAllButton ? null : index - 1)
                        ? (isDarkMode
                        ? const Color(0xFF006699) //Seleccionado en modo oscuro
                        : const Color(0xFF006699) //Seleccionado en modo claro
                        ) 
                        : (isDarkMode ?
                        Colors.transparent// No seleccionado en modo oscuro
                        : Colors.transparent // No seleccionado en modo claro
                        ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    ref.read(_selectedButtonIndexProvider.notifier).state =
                        isAllButton ? null : index - 1;
                    ref.read(_selectedImageIndexProvider.notifier).state = null;
                  },
                  child: TitulosHeader(
                    titulo: buttonData[index]['titulo'],
                    // subtitulo: buttonData[index]['subtitulo'],
                    tituloNegrita: isAllButton 
                    ? selectedButtonIndex == null // Negritas si "Todas" está seleccionado
                    : selectedButtonIndex == index - 1, 
                    subtituloNegrita: false,
                    tamanoTitulo: 16,
                    tamanoSubtitulo: 16,
                    tieneFondo: false,
                  ),
                  
                ),
              );
            }),
          ),
        ),
      ),
           
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,   // Padding en el lado izquierdo
                  top: 0.0,    // Padding en la parte superior
                  right: 0.0,  // Padding en el lado derecho
                  bottom: 0.0,  // Padding en la parte inferior
                ),
                child: Container(
                alignment: Alignment.centerLeft,  // Alinea al lado izquierdo
                padding: const EdgeInsets.only(left: 16.0),  // Margen izquierdo
                child: const TitulosHeader(
                  titulo: '2019, 2018',
                  tituloNegrita: true,
                  tamanoTitulo: 22,
                  tieneFondo: false,
                    mainAxisAlignment: MainAxisAlignment.start, // Alineación vertical (arriba)
                  crossAxisAlignment: CrossAxisAlignment.start, // Alineación horizontal (izquierda)
                ),
                            ),
              ),



        const SizedBox(height: 2), // Espacio entre botones e imágenes
        // Imágenes (muestra todas o las del grupo seleccionado)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (int index = 0;
                index <
                    (selectedButtonIndex == null
                        ? allImages.length
                        : images[selectedButtonIndex].length);
                index++)
              GestureDetector(
                onTap: () {
                  ref.read(_selectedImageIndexProvider.notifier).state = index;
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                  left: 10.0,   // Padding en el lado izquierdo
                  top: 0.0,     // Padding en la parte superior
                  right: 10.0,  // Padding en el lado derecho
                  bottom: 8.0,  // Padding en la parte inferior
                ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          selectedButtonIndex == null
                              ? allImages[index]
                              : images[selectedButtonIndex][index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      if (selectedImageIndex == index)
                        Container(
                          color: isDarkMode ? const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5) : const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TitulosHeader(
                                titulo: selectedButtonIndex == null
                                ? imagesData[index]['titulo'] // Si "Todas" está seleccionado
                                : imagesData[(selectedButtonIndex * 2) + index]['titulo'], 
                                subtitulo: "Toma de Protesta",
                                tituloNegrita: true,
                                subtituloNegrita: false,
                                tamanoTitulo: 20,
                                tamanoSubtitulo: 16,
                                tieneFondo: false,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.zoom_in,
                                  color: isDarkMode ? Colors.white : Colors.black, // Color según el modo
                                ),
                                iconSize: 30.0, // Ajusta el tamaño del ícono aquí
                                onPressed: () {
                                  _showImageZoomPopup(
                                    context,
                                    selectedButtonIndex == null
                                        ? allImages
                                        : images[selectedButtonIndex],
                                    index,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 20), // Espacio entre fin de imagenes y footer

      ],
    );
  }

  void _showImageZoomPopup(
      BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: images.length,
              pageController: PageController(initialPage: initialIndex),
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2.5,
                  heroAttributes:
                      PhotoViewHeroAttributes(tag: images[index]),
                );
              },
              backgroundDecoration:
                  const BoxDecoration(color: Colors.black87),
              loadingBuilder: (context, event) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Proveedores de estado
final _selectedButtonIndexProvider = StateProvider<int?>((ref) => null);
final _selectedImageIndexProvider = StateProvider<int?>((ref) => null);
