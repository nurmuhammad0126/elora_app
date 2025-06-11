import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.elaro.uz/api',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("METHOD TYPE: ${options.method}");
          log("METHOD TYPE: ${options.path}");
          log("REQUEST BODY: ${options.data}");
          return handler.next(options);
        },

        onResponse: (response, handler) {
          log("RESPONSE STATUS CODE: ${response.statusCode}");
          // log("RESPONSE DATA: ${response.data}");
          log("RESPONSE path: ${response.headers}");

          return handler.next(response);
        },
        onError: (e, handler) {
          log("On Error: $e");
          return handler.next(e);
        },
      ),
    );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
