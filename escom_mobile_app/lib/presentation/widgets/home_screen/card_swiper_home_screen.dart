import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> slides = [
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide1.png',
        'mainButton': {'text': 'RESULTADOS', 'onPressed': () {}},
        'buttons': [
          {
            'text': 'GACETA',
            'onPressed': () {
              _launchURL(
                  'https://www.escom.ipn.mx/docs/slider/gacetaDireccion.pdf');
            }
          },
          {
            'text': 'MINISITIO',
            'onPressed': () {
              _launchURL('https://www.escom.ipn.mx/ternas/direccion2024.html');
            }
          },
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide2.png',
        'mainButton': {
          'text': 'CONVOCATORIA CONTRATACIÓN DOCENTE',
          'onPressed': () {}
        },
        'buttons': [
          {
            'text': 'MICROSITIO',
            'onPressed': () {
              _launchURL('https://www.escom.ipn.mx/oposicion2024.html');
            }
          },
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide3.png',
        'mainButton': {'text': 'CONVOCATORIA', 'onPressed': () {}},
        'buttons': [
          {
            'text': 'CONVOCATORIA',
            'onPressed': () {
              _launchURL(
                  'https://www.escom.ipn.mx/docs/slider/Convocatoria%20PD-2025.pdf');
            }
          },
          {
            'text': 'CRONOGRAMA',
            'onPressed': () {
              _launchURL(
                  'https://www.escom.ipn.mx/docs/slider/Cronograma%20de%20actividades%20PD-2025.pdf');
            }
          },
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide4.png',
        'mainButton': {'text': 'RESULTADOS', 'onPressed': () {}},
        'buttons': [
          {
            'text': 'CONSULTA',
            'onPressed': () {_launchURL('https://www.ipn.mx/daes/servicios/becas/resultados-convocatoriageneral-2025-1.html');}
          },
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide5.png',
        'mainButton': {'text': 'CONVOCATORIAS', 'onPressed': () {}},
        'buttons': [
          {'text': 'TÉCNICO DOCENTE', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/ConvocatoriaTD2024.pdf');}},
          {'text': 'NIVEL SUPERIOR', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/ConvocatoriaBANS.pdf');}},
          {'text': 'PLAZAS CARRERA 30 HRS', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/ConvocatoriaPlaza30.pdf');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide6.png',
        'mainButton': {'text': 'CÓDIGO DE ÉTICA', 'onPressed': () {}},
        'buttons': [
          {'text': 'CÓDIGO DE ÉTICA', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/Codigo-IPN-2023.pdf');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide7.png',
        'mainButton': {'text': 'COMITÉ DE ÉTICA DEL IPN', 'onPressed': () {}},
        'buttons': [
          {'text': 'CÁPSULA', 'onPressed': () {_launchURL('https://forms.gle/1K5HoqVi6wmm1Dmd9');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide8.png',
        'mainButton': {'text': 'NUEVO INGRESO', 'onPressed': () {}},
        'buttons': [
          {'text': 'PROCESO DE INSCRIPCIÓN', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/nuevoingreso25_2/assets/docs/ProcedimientoInscripcionNuevoIngreso_25_2.pdf');}},
          {'text': 'MINISITIO', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/nuevoingreso25_2/');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide9.png',
        'mainButton': {'text': 'PRESTACIÓN DE SERVICIOS', 'onPressed': () {}},
        'buttons': [
          {'text': 'CIC - CAFETERÍA Y BARRA DE CAFÉ', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/CIC_ResultadosServicio.pdf');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide10.png',
        'mainButton': {'text': 'CONVOCATORIA', 'onPressed': () {}},
        'buttons': [
          {'text': 'CONVOCATORIA', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/posgrado/convocatoria/');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide11.png',
        'mainButton': {'text': 'CONVOCATORIA', 'onPressed': () {}},
        'buttons': [
          {'text': 'CONVOCATORIA', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/posgrado/convocatoriaMaestriaIACD/?utm_source=canva&utm_medium=iframely');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide12.png',
        'mainButton': {'text': 'DONATIVOS', 'onPressed': () {}},
        'buttons': [
          {'text': 'MÁS INFORMACIÓN', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/docs/slider/Campania_Donativo_25_1.pdf');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide13.png',
        'mainButton': {'text': 'RESULTADOS', 'onPressed': () {}},
        'buttons': [
          {'text': 'CONSULTA', 'onPressed': () {_launchURL('https://drive.google.com/file/d/1F9F2V9SgHNctIlh36c6U-NnGsawg6O8w/view?usp=sharing');}},
        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide14.png',
        'mainButton': {'text': 'SEGUIMIENTO DE ACUERDOS', 'onPressed': () {}},
        'buttons': [
          {'text': 'MINISITIO SEGUIMIENTO', 'onPressed': () {_launchURL('https://www.escom.ipn.mx/x/acuerdos2022/');}},
          {'text': 'ACUERDOS FIRMADOS -101022-', 'onPressed': () {_launchURL('https://tinyurl.com/3x57wnc9');}},
          {'text': 'RECALENDARIZACIÓN', 'onPressed': () {_launchURL('https://tinyurl.com/bdw654cv');}},

        ],
      },
      {
        'image': 'assets/images/sliders/home_screen/custom_slider/slide15.png',
        'mainButton': {'text': '#IPN SIN VIOLENCIA', 'onPressed': () {}},
        'buttons': [
          {'text': 'DENUNCIA SEGURA', 'onPressed': () {_launchURL('https://www.denunciasegura.ipn.mx');}},
        ],
      },
    ];

  return SizedBox(
      height: 200, // Aumentada la altura para mejor distribución
      child: Swiper(
        itemCount: slides.length,
        itemBuilder: (BuildContext context, int index) {
          final slide = slides[index];
          return OverflowBox(
            maxHeight: double.infinity,
            child: Container(
              
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(slide['image']),
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 237, 237, 237).withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Botón principal
                    FadeInDown(
                      child: _buildMainButton(slide['mainButton']),
                    ),
                    const SizedBox(height: 20),
                    // Botones secundarios
                    _buildSecondaryButtons(slide['buttons']),
                  ],
                ),
              ),
            ),
          );
        },
        autoplay: true,
        autoplayDelay: 5000,
        loop: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).primaryColor,
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          ),
        ),
        control: SwiperControl(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildMainButton(Map<String, dynamic> buttonData) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: buttonData['onPressed'],
      child: Text(buttonData['text']),
    );
  }

  Widget _buildSecondaryButtons(List<dynamic> buttons) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: buttons.asMap().entries.map((entry) {
        final index = entry.key;
        final button = entry.value;
        
        return FadeInUp(
          delay: Duration(milliseconds: 200 * (index + 1)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: button['onPressed'],
            child: Text(button['text']),
          ),
        );
      }).toList(),
    );
  }
}

void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }
