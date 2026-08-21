import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ErrorUtil {
  /// Handles common repository exceptions and returns a user-friendly exception.
  static Object handleRepositoryException(Object e, String reason) {
    // 1. Log locally for debugging
    LoggerUtil.error("Error in $reason: $e");

    if (e is DioException) {
      // Handle Server Errors (500+)
      if (e.response != null &&
          e.response!.statusCode != null &&
          e.response!.statusCode! >= 500) {
        // Record server errors to Crashlytics as they indicate backend issues
        FirebaseCrashlytics.instance.recordError(
          e,
          e.stackTrace,
          reason: '$reason (Server Error ${e.response!.statusCode})',
        );
        return DataException(
          'Terjadi kesalahan di server. Ulangi beberapa saat lagi',
        );
      }

      // Handle common network errors (Do NOT record to Crashlytics)
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return DataException('Koneksi timeout. Periksa internet Anda');
      }

      if (e.type == DioExceptionType.connectionError) {
        return DataException('Tidak dapat terhubung ke server');
      }
    }

    // Handle Data Parsing Errors (Non-critical environmental issues)
    if (e is FormatException || e is TypeError) {
      return DataException(
          'Terjadi kesalahan pada server. Mohon tunggu beberapa saat...');
    }

    // Pass through recognized app exceptions
    if (e is ApiException) return e;
    if (e is Exception) return e;

    // 2. Record truly unexpected errors to Crashlytics
    FirebaseCrashlytics.instance.recordError(
      e,
      StackTrace.current,
      reason: '$reason (Unexpected)',
    );

    return DataException('Terjadi kesalahan yang tidak terduga');
  }
}
