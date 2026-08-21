import 'package:app/core/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_interceptor.g.dart';

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) {
  return AuthInterceptor(ref);
}

class AuthInterceptor extends Interceptor {
  final Ref ref;

  // Flag untuk mencegah multiple refresh secara bersamaan
  bool _isRefreshing = false;

  AuthInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await ref.read(tokenStorageProvider).getAccessToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final requestPath = err.requestOptions.path;

    // Jika bukan 401, atau sedang di endpoint refresh (hindari infinite loop),
    // langsung teruskan error
    final isRefreshEndpoint = requestPath.contains('refresh-access-token');
    if (statusCode != 401 || isRefreshEndpoint) {
      return handler.next(err);
    }

    // Jika sudah sedang refresh, jangan ulangi
    if (_isRefreshing) {
      LoggerUtil.warning('AuthInterceptor: Refresh sudah berjalan, skip retry.');
      return handler.next(err);
    }

    _isRefreshing = true;
    LoggerUtil.warning('AuthInterceptor: 401 terdeteksi, mencoba refresh token...');

    try {
      final tokenStorage = ref.read(tokenStorageProvider);
      final oldToken = await tokenStorage.getAccessToken();

      if (oldToken == null) {
        LoggerUtil.error('AuthInterceptor: Tidak ada token untuk di-refresh.');
        _isRefreshing = false;
        return handler.next(err);
      }

      // Panggil endpoint refresh
      final authRemoteDataSource = ref.read(authRemoteDatasourceProvider);
      final refreshAccessTokenResult = await authRemoteDataSource.refreshToken(oldToken);

      if (refreshAccessTokenResult.data == null) {
        LoggerUtil.error('AuthInterceptor: Gagal refresh token: Tidak ada data.');
        _isRefreshing = false;
        
        return handler.next(err);
      }

      final String newToken = refreshAccessTokenResult.data!.accessToken;

      // Simpan token baru
      await tokenStorage.saveAccessToken(newToken);
      LoggerUtil.debug('AuthInterceptor: Token berhasil di-refresh, retry request.');

      // Retry request asli dengan token baru
      final retryOptions = err.requestOptions;
      retryOptions.headers["Authorization"] = "Bearer $newToken";

      final dio = Dio(
        BaseOptions(
          baseUrl: retryOptions.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final retryResponse = await dio.fetch(retryOptions);
      _isRefreshing = false;
      return handler.resolve(retryResponse);
    } catch (e) {
      LoggerUtil.error('AuthInterceptor: Gagal refresh token: $e');
      _isRefreshing = false;

      // Refresh gagal → clear session dan teruskan error 401 asli
      // AuthService akan menangkap 401 ini dan melakukan logout
      await ref.read(tokenStorageProvider).clearAll();
      return handler.next(err);
    }
  }
}
