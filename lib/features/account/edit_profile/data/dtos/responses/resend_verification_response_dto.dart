import 'package:app/core/models/api_response_dto.dart';

class ResendVerificationResponseDto extends ApiResponseDto<void> {
  ResendVerificationResponseDto({
    required super.success,
    required super.message,
    super.errors,
  });

  factory ResendVerificationResponseDto.fromJson(Map<String, dynamic> json) {
    return ResendVerificationResponseDto(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : null,
    );
  }
}
