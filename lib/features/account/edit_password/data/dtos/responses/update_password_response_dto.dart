import 'package:app/core/models/api_response_dto.dart';

class UpdatePasswordResponseDto extends ApiResponseDto<void> {
  UpdatePasswordResponseDto({
    required super.success,
    required super.message,
    super.errors,
  });

  factory UpdatePasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponseDto(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : null,
    );
  }
}
