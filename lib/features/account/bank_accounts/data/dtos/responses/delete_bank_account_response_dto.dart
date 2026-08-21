import 'package:app/core/models/api_response_dto.dart';

class DeleteBankAccountResponseDto extends ApiResponseDto<void> {
  DeleteBankAccountResponseDto({
    required super.success,
    required super.message,
    super.errors,
  });

  factory DeleteBankAccountResponseDto.fromJson(Map<String, dynamic> json) {
    return DeleteBankAccountResponseDto(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : null,
    );
  }
}
