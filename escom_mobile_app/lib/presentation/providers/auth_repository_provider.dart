import 'package:escom_mobile_app/config/helpers/dio_helper.dart';
import 'package:escom_mobile_app/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../data/datasources/remote/auth_datasource.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final authDatasource = AuthDatasource(dio: dio);
  return AuthRepositoryImpl(datasource: authDatasource);
});

// Si aún no tienes el dioProvider, también lo creamos:
final dioProvider = Provider((ref) => DioHelper.createDio());