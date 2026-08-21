import 'package:app/core/models/api_response_dto.dart';

class LogoutResponseDto extends ApiResponseDto<void> {
  LogoutResponseDto({
    required super.success,
    required super.message,
    super.errors,
  });

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) {
    return LogoutResponseDto(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : null,
    );
  }
}
