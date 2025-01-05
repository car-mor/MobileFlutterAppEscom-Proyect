import 'package:dio/dio.dart';
import 'package:escom_mobile_app/config/constants/environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para gestionar Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: Environment.apiBaseUrl));
});
