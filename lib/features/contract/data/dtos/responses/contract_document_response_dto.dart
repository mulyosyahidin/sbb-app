import 'package:app/core/models/api_response_dto.dart';

class ContractDocumentResponseDto extends ApiResponseDto<void> {
  ContractDocumentResponseDto({
    required super.success,
    required super.message,
    super.errors,
  });

  factory ContractDocumentResponseDto.fromJson(Map<String, dynamic> json) {
    return ContractDocumentResponseDto(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'] as Map)
          : null,
    );
  }
}
