
import 'package:app/core/errors/api_exception.dart';

class ApiResponseDto<T> {
  final bool success;
  final String message;
  final T? data;
  final Map<String, dynamic>? errors;

  ApiResponseDto({
    required this.success,
    required this.message,
    this.data,
    this.errors,
  });

  /// Returns the main message.
  String get errorMessage => message;

  /// Converts the response to an [ApiException].
  ApiException toException() {
    Map<String, String>? errorMap;
    if (errors != null) {
      errorMap = errors!.map((key, value) {
        if (value is List) {
          return MapEntry(key, value.first.toString());
        }
        return MapEntry(key, value.toString());
      });
    }
    return ApiException(message, errors: errorMap);
  }

  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponseDto<T>(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? fromJsonT(json["data"]) : null,
      errors: json["errors"] != null
          ? Map<String, dynamic>.from(json["errors"])
          : null,
    );
  }
}
