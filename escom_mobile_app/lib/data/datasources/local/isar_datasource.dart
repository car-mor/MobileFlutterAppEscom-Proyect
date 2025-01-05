import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/isar.dart';

class IsarDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          AlumnoSchema,
          UsuarioSchema,
          ProfesorSchema,
          HorarioSchema,
          GrupoSchema
        ],
        directory: dir.path,
        inspector: true, // Útil para desarrollo
      );
    }

    return Future.value(Isar.getInstance());
  }
}