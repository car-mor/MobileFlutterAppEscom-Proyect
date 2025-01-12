import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //Load more images
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
    // addTwentyImages();
    // setState(() {});
    if (isLoading) {
      return;
    } //Se sale porque ya está cargando las imágenes, si no se pone en true
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addTwentyImages();
    isLoading = false;
    if (!isMounted) {
      return;
    } //Si no está montado, no se actualiza el estado
    setState(() {});
    moveScrollToBottom();

  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) {
      return;
    }
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1 );
    addTwentyImages();
    setState(() {
      
    });

  }

 void moveScrollToBottom() {

    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );

  }

  void addTwentyImages() {
     final lastId = imagesIds.last;

    // imagesIds.add(firstId + 1);
    // imagesIds.add(firstId + 2);
    // imagesIds.add(firstId + 3);
    // imagesIds.add(firstId + 4);

    imagesIds.addAll([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Galería de imágenes'),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  FadeInImage(
                    fit: BoxFit.cover, // Para que la imagen se ajuste al tamaño del contenedor
                    height: 300,
                    width: double.infinity,
                    placeholder: const AssetImage('assets/images/placeholder.jpg'), // Placeholder de imagen
                                        image: imagesIds[index] > 20
                        ? const AssetImage('assets/images/placeholder.jpg') // Muestra el placeholder si el id es mayor a 20
                        : AssetImage('images/gallery/${imagesIds[index]}.jpg'), // Carga la imagen real si es menor o igual a 20
                  ),
                  if (isLoading) const Positioned.fill(
                    child:
                        CircularProgressIndicator.adaptive(), // Muestra el widget AnimatedDot mientras carga la imagen
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_new_outlined),
        // child: const CircularProgressIndicator(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
