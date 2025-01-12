import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/footer.dart';
import 'package:escom_mobile_app/presentation/widgets/header.dart';
import 'package:escom_mobile_app/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:escom_mobile_app/presentation/providers/theme_provider.dart';
import 'package:escom_mobile_app/presentation/widgets/widgets.dart';

class MovilidadScreen extends ConsumerWidget {

  static const String name = 'movilidad_screen';

  const MovilidadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).isDarkmode;
    final Color textoColor = isDarkMode ? Colors.white : Colors.black; // Color del texto según el tema

    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textoColor,
        );
    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textoColor,
        );
    //Color del texto dependiendo el tema
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESCOM-MOBILE'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ProfileAvatar(
              imageUrl: null, // Pasa la URL aquí si está disponible
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              imagePath: 'assets/images/header.png',
              onToggleTheme: themeNotifier.toggleTheme, // Pasa la función
              isDarkMode: isDarkMode, // Pasa el estado
            ),

            const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 14),
            child: TitulosHeader(
                  titulo: "Movilidad Académica",
                  subtitulo: "ESCOMUNIDAD",
                  tituloNegrita: true,
                  subtituloNegrita: false,
                  tamanoTitulo: 28,
                  tamanoSubtitulo: 18,
                  tieneFondo: true,
                ),
          ),
        

            const SizedBox(height: 10),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Correo electrónico
                  Row(
                    children: [ 
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Programa Institucional de Movilidad Académica',
                              style: titleStyle, 
                            ),
                            Text(
                              'Este Programa permite a los estudiantes del IPN fortalecer su nivel académico propiciando su participación en actividades de integración e intercambio de conocimientos mediante semestres académicos, permitiendo el enriquecimiento de su experiencia formativa de manera vivencial, fomentando el conocimiento e intercambio de ideas y formas de aprendizaje, aunado a la generación de redes del conocimiento.',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Redes sociales
                  Row(
                    children: [ 
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                          children: [
                            Text(
                              'Becas',
                              style: titleStyle,  
                            ),
                            Text(
                              'Los estudiantes podrán mantener su beca durante el tiempo que participen en un programa de movilidad académica, de acuerdo con la normatividad existente. Así como el apoyo económico que otorga la Dirección de Relaciones Internacionales - DRI (antes CCA), la cual es para sufragar los gastos de manutención durante su estancia de movilidad, siempre y cuando la realicen en una institución que se encuentre en otra localidad diferente a donde se encuentra la escuela de origen (ESCOM). Lo anterior, como parte para alimentación, alojamiento y transporte durante la estancia de movilidad internacional, por un máximo de 5 meses y por una sola ocasión en un programa académico.',
                              style: subtitleStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )      
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const ExpansionTileExample1(),
                  
                  const SizedBox(height: 12),

                  Divider(
                    color: textoColor,
                    height: 2.5,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),

                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      'Etapas del Proceso de Movilidad',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  
                  const SizedBox(height: 15),

                  const ExpansionTileExample2(),
                  const SizedBox(height: 12),

                  Divider(
                    color: textoColor,
                    height: 2.5,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),

                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      'Experiencias',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Informes:',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lic. Norma Olalde Mogallán',
                      style: subtitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Para centrar el ícono y el texto
                      children: [
                        const Icon(Icons.phone, size: 18, color: Colors.grey),
                        const SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          '5557296000 Ext. 52005',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Para centrar el ícono y el texto
                      children: [
                        const Icon(Icons.email, size: 18, color: Colors.grey),
                        const SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          'upis.escom.ipn@gmail.com',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

            const SizedBox(height: 20),


            const FooterWidget(
              imagePathTop: 'assets/images/logoSEP.png',
              imagePathBottom: 'assets/images/logoGOB.png',
            ),
          ],
        ),
      ),
      drawer: SideMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
    );
  }
}


class ExpansionTileExample1 extends StatefulWidget {
  const ExpansionTileExample1({super.key});

@override
  State<ExpansionTileExample1> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample1> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        
        ExpansionTile(
          title: Text('Movilidad Nacional'),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      Text(
                        'Estados',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        'Algunos de los estados con los que se tienen convenio actualmente son: Aguascalientes, Baja California, Campeche, Chiapas, Chihuahua, Colima, Estado de México, Guerrero, Hidalgo, Jalisco, Nuevo León, Oaxaca, Puebla, Querétaro, San Luis Potosí, Sinaloa, Sonora, Tamaulipas, Tlaxcala, Veracruz, Yucatán, Zacatecas. Aproximadamente 31 estados y 154 universidades.',  
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Requisitos',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        '• Haber cubierto el 50% y no más del 80% del programa de licenciatura al momento de realizar la movilidad.\n'
                        '• No estar en el último semestre de la licenciatura al momento de realizar la solicitud.\n'
                        '• Ser alumno regular inscrito en un programa académico de modalidad escolarizada.\n'
                        '• Promedio general mínimo de 8.5.\n'
                        '• No haber participado previamente en el ProMAN.\n'
                        '• No encontrarse participando en algún otro programa de movilidad académica del IPN y que cuente con apoyo económico de la DRI.\n'
                        '• El alumnado inscrito en el IPN con nacionalidad extranjera deberá acreditar su estancia legal mediante su calidad migratoria o carta de naturalización, en caso de aplicar.\n'
                        '• Cumplir con las restricciones sanitarias y/o vacunas requeridas por la ID (Institución Destino)..',  
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
        ExpansionTile(
          title: Text('Movilidad Internacional'),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      Text(
                        'Países',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        'Algunos de los países con los que se tienen convenio actualmente son: Alemania, Argentina, Bélgica, Brasil, Canadá, Chile, China, Colombia, Costa Rica, Corea del Sur, Ecuador, España, Francia, India, Italia, Perú, Polonia, Portugal, República Checa, República Dominicana, Suecia y Vietnam . Aproximadamente 27 países y 120 universidades.',  
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Requisitos',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        '• Ser alumno regular.\n'
                        '• Contar con un promedio general mínimo de 8.5.\n'
                        '• Haber obtenido al menos el 50% y no más del 80% de los créditos del plan de estudios correspondiente.\n'
                        '• Podrán postularse alumnos que estén cursando hasta el antepenúltimo periodo escolar de su programa académico.\n'
                        '• Contar con el dominio del idioma que se requiere, de acuerdo a la institución de destino y conforme a lo establecido en la lista de insituciones participantes.\n'
                        '• No haber participado previamente en el ProMAI.\n'
                        '• No encontrarse participando en algún otro programa de movilidad académica del IPN y que cuente con apoyo económico de la DRI.\n'
                        '• El alumnado inscrito en el IPN con nacionalidad extranjera deberá acreditar su estancia legal mediante su calidad migratoria o carta de naturalización, en caso de aplicar.\n'
                        '• Cumplir con las restricciones sanitarias y/o vacunas requeridas por el país de la ID (Institución Destino).',  
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),
            
          ],
        ),
        
        
        
      ],
    );
  }
}



class ExpansionTileExample2 extends StatefulWidget {
  const ExpansionTileExample2({super.key});

@override
  State<ExpansionTileExample2> createState() => _ExpansionTileExampleState2();
}

class _ExpansionTileExampleState2 extends State<ExpansionTileExample2> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        
        ExpansionTile(
          title: Text(
            '1. Inscripción o Registro',
            style: TextStyle(         // Cambia el color del texto a azul
              fontWeight: FontWeight.bold, // Establece el texto en negritas
              fontSize: 18.0, // Cambia el tamaño de la letra
            ),
          ),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      
                      Text(
                        '1. La DRI emite las convocatorias de movilidad correspondientes al semestre actual.\n'
                        '2. La UPIS difunde las convocatorias.\n'
                        '3. El alumno verifica que cumple con TODOS los requisitos, particularmente el del idioma de la Universidad seleccionada y que en ella existe oferta educativa en el semestre en que va a participar y en el idioma que domina.\n'
                        '4. La UPIS solicita a Gestión Escolar:\n'
                        ' • Constancia de estudios que incluya el porcentaje de créditos y el promedio general.\n'
                        ' • Boleta global de estudios.\n'
                        '5. El alumno se asegura de tener comprobante vigente de dominio del idioma. Si lo requiere, solicita a la UPIS apoyo para gestionar su presentación de examen de idioma en el CENLEX-IPN (realiza el pago correspondiente) o realiza el trámite por su cuenta en alguna otra institución acreditada para tal fin. Presenta el examen y obtiene el comprobante de dominio del Idioma.\n'
                        '6. El alumno solicita a la UPIS que gestione un oficio de postulación por parte del Director de la ESCOM.\n'
                        '7. El alumno llena el formato "Solicitud de Participación en el Programa de Movilidad (Formato DRI02). Estudiante-IPN".\n'
                        '8. El alumno elabora con asesoría del jefe del Departamento de Innovación Educativa el formato de equivalencias de materias (Formato DRI07) con un mínimo de 5 Unidades de Aprendizaje (UA), indicando el número de créditos. Sí pueden inscribirse UA que no vayan a ofertarse el siguiente semestre en la ESCOM, pero que estén en la Currícula de la carrera.\n'
                        '9. El alumno entrega a la UPIS el expediente con toda la documentación y en el orden solicitado en la convocatoria. El expediente, se entregará en un folder tamaño carta, sin broche ni grapas y con su nombre en la pestaña: apellido paterno, materno y nombre(s).',  
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Documentos solicitados al alumno para la primera entrega:',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        '1. Oficio de postulación por parte del Director de la unidad académica. (UPIS lo elabora)\n'
                        '2. Solicitud de Participación en el Programa de Movilidad Académica se llena en línea, y se imprime.\n'
                        '3. Copia legible de la constancia de estudios que incluya el porcentaje de créditos y el promedio general.\n'
                        '4. Copia legible de la Boleta global de estudios.\n'
                        '5. Copia del comprobante del dominio de idioma requerido por la institución de destino.\n'
                        '6. Carta de motivos redactada en idioma Español e Inglés.\n'
                        '7. Currículum Vitae resumido (máximo dos hojas, formato europeo).',  
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
        ExpansionTile(
          title: Text(
            '2. Asignación Postulación y Aceptacion',
            style: TextStyle(         // Cambia el color del texto a azul
              fontWeight: FontWeight.bold, // Establece el texto en negritas
              fontSize: 18.0, // Cambia el tamaño de la letra
            ),
          ),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      
                      Text(
                        '1. La UPIS recibe los documentos que integrarán el expediente del alumno y lo envía a la DRI.\n'
                        '2. La DRI recibe y analiza los expedientes y los envía a las Universidades destino y espera respuesta. Da a conocer los resultados e indica la fecha para la segunda entrega de documentos (envía check list al alumno).\n'
                        '3. El alumno integra la documentación según el checklist y la entrega a la DRI, con la persona y fecha que se indica.\n'
                        '4. La DRI recibe y revisa la documentación. Realiza los trámites correspondientes al interior del Instituto para que se analice y apruebe académicamente la movilidad. La DRI o la Universidad destino envía al alumno la carta de aceptación. A partir de ahí el alumno puede establecer contacto directo con la Universidad destino. La DRI determina el apoyo económico y envía una carta al alumno. El tiempo aproximado para todos los trámites es de 2 meses.\n'
                        '5. El alumno tramita un seguro de gastos médicos mayores. Con este seguro, su carta de aceptación Universidad destino; carta apoyo económico y demás requisitos tramita su visa de estudiante. Con visa y todo lo necesario compra un boleto redondo para el viaje. ANTES DE IRSE, se inscribe normalmente en la ESCOM a su siguiente semestre. Aparecerá en SAES como estudiante en movilidad . No aparecerá en listas por lo que no habrá caificación a reportar en la Unidad.',  
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Documentos solicitados al alumno para la segunda entrega:',
                        style: TextStyle(
                          color: Colors.blue, // Cambia el color del texto a azul
                          fontWeight: FontWeight.bold, // Establece el texto en negritas
                          fontSize: 20.0, // Cambia el tamaño de la letra
                        ),
                      ),
                      Text(
                        '1. Formatos solicitados por la institución de destino (solicitud, formatos de materias, etc.).\n'
                        '2. Boleta global de calificaciones traducida por un perito certificado en los casos que sea requerida por la institución de destino.\n'
                        '3. Constancia original de estudios traducida por un perito certificado en los casos que sea requerida por la institución de destino.\n'
                        '4. COMPROBANTE DEL DOMINIO DE IDIOMA requerido por la institución de destino.\n'
                        '5. Copia del pasaporte (con vigencia de por lo menos seis meses posteriores la fecha estimada de terminación de la estancia).\n'
                        '6. Mapa curricular de la institución de destino (indicando con marca textos los cursos que aparecen en el DRI07).\n'
                        '7. Formato DRI07 debidamente firmado y sellado con fecha actualizada. Las asignaturas de la institución de destino deberán escribirse en el idioma en que se encuentra en el mapa curricular de la institución de destino, indicando entre paréntesis el número de créditos ( mínimo 5 asignaturas del mapa curricular).\n'
                        '8. Carta compromiso (Formato DRI05).**\n'
                        '9. Carta de Apoyo Económico o cuenta bancaria con monto estipulado por la insititución destino, en caso de que sea requerida por la misma.**\n'
                        '10. Otros\n\n'
                        '** No todas las instituciones lo solicitan. Verificar los requisitos de cada Universidad o país destino para más información.',
                        textAlign: TextAlign.justify,  
                      ),
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),
            
          ],
        ),
        ExpansionTile(
          title: Text(
            '3. Participación',
            style: TextStyle(         // Cambia el color del texto a azul
              fontWeight: FontWeight.bold, // Establece el texto en negritas
              fontSize: 18.0, // Cambia el tamaño de la letra
            ),
          ),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      Text(
                        '1. El alumno se traslada a la institución de destino. Se presenta, registra e inscribe las materias seleccionadas en su DRI07. Cualquier cambio en las materias propuestas para cursar en movilidad, notificará al jefe de Innovación Educativa (ccp área movilidad y CCA).\n'
                        '2. El alumno envía a la DRI (Depto. de Seguimiento y Evaluación) y a la UPIS el comprobante de inscripción en la institución de destino y los Programas de los cursos a los que se inscribió (durante el primer mes de estancia).\n'
                        '3. La UPIS envía a Innovación Educativa el comprobante de inscripción y los programas de los cursos para que elabore el análisis de equivalencia de las unidades de aprendizaje para DRI07 Definitivo.\n'
                        '4. El alumno cursa y acredita las materias inscritas en la institución de destino.\n'
                        '5. Al concluir su movilidad, el alumno, deberá asegurarse de que se le emita su Certificado de Fin de Estancia; así como de realizar los trámites necesarios para que se emita su boleta de calificaciones de los cursos realizados; y de no dejar algún pendiente en la institución de destino en la que se participó (académico, administrativo o económico).',  
                        textAlign: TextAlign.justify,
                      ), 
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),  
          ],
        ),
        ExpansionTile(
          title: Text(
            '4. Reincorporación',
            style: TextStyle(         // Cambia el color del texto a azul
              fontWeight: FontWeight.bold, // Establece el texto en negritas
              fontSize: 18.0, // Cambia el tamaño de la letra
            ),
          ),
          children: <Widget>[
            Row(
              children: [ 
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos los textos a la izquierda
                    children: [
                      Text(
                        '1. El alumno se reincorpora a la ESCOM, se inscribe previamente enviando 3 propuestas de horario con 2 semanas de enticipacion a la fecha de inscripción. Entrega a la DRI (Departamento de Seguimiento y Evaluación) su certificado de fin de estancia.\n'
                        '2. La DRI recibe boleta de calificaciones de la Universidad destino y la envía a la DES ccp para la ESCOM.\n'
                        '3. La UPIS envía copia de boleta de calificaciones a Innovación Educativa para que verifique cuidadosamente nombres de Unidad de Aprendizaje (UA) y el número de créditos en DRI07 definitivo.\n'
                        '4. Innovación Educativa envía a la DES (mediante oficio) DRI07 definitivo así como boleta global de calificaciones para dictamen técnico de equivalencia de UA cursadas en movilidad.\n'
                        '5. La DES emite (en el transcurso de mes y medio aproximadamente) el Dictamen de Revalidación correspondiente y solicita a la DAE emita la Equivalencia respectiva.\n'
                        '6. La DAE emite la Constancia de Equivalencia (Revalidación de estudios) que sacará fotocopia para que la ing. Patricia Escamilla rubrique y entregará al alumn@ para que lleve a Gestión Escolar de la ESCOM para su registro en el SAES, a su vez, deberá también entregar una copia en las oficinas de la UPIS para la finalización del proceso en su expediente.',  
                        textAlign: TextAlign.justify,
                      ), 
                    ],
                  )      
                ),
              ],
            ),
            SizedBox(height: 12),  
          ],
        ),  
      ],
    );
  }
}