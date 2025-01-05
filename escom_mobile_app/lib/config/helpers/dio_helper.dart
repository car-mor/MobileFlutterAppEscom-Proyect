import 'package:dio/dio.dart';

class DioHelper {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'YOUR_API_BASE_URL', // Replace with your actual API URL
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging, token management, etc.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // You can add token here if needed
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}