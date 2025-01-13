import 'package:escom_mobile_app/config/helpers/dio_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();  // Instancia el ApiService
});