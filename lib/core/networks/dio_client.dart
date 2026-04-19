import 'package:app/core/config/env.dart';
import 'package:app/core/networks/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

class DioClient {
  static Dio create(String baseUrl, Ref ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl.trim(),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status != null && status < 500,
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(ref.read(authInterceptorProvider));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return DioClient.create(Env.apiBaseUrl, ref);
}
