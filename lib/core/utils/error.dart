import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ErrorUtil {
  /// Handles common repository exceptions and returns a user-friendly exception.
  static Object handleRepositoryException(Object e, String reason) {
    if (e is DioException) {
      if (e.response != null &&
          e.response!.statusCode != null &&
          e.response!.statusCode! >= 500) {
        return DataException(
          'Terjadi kesalahan di server. Ulangi beberapa saat lagi',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return DataException('Koneksi timeout. Periksa internet Anda');
      }

      if (e.type == DioExceptionType.connectionError) {
        return DataException('Tidak dapat terhubung ke server');
      }
    }

    if (e is ApiException) return e;
    if (e is Exception) return e;

    Logger.error("Unexpected Error in $reason: $e");

    FirebaseCrashlytics.instance.recordError(
      e,
      StackTrace.current,
      reason: '$reason (Unexpected)',
    );

    return DataException('Terjadi kesalahan yang tidak terduga');
  }
}
