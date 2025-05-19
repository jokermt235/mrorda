import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = 'https://your-bookstore-api.com'; // Replace with your API URL
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(path, queryParameters: queryParams);
  }
}