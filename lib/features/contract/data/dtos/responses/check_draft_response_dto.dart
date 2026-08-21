import 'package:app/core/models/api_response_dto.dart';

class CheckDraftResponseData {
  final bool hasDraft;

  CheckDraftResponseData({
    required this.hasDraft,
  });

  factory CheckDraftResponseData.fromJson(Map<String, dynamic> json) {
    return CheckDraftResponseData(
      hasDraft: json['has_draft'] as bool,
    );
  }
}

class CheckDraftResponseDto extends ApiResponseDto<CheckDraftResponseData> {
  CheckDraftResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CheckDraftResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CheckDraftResponseData.fromJson(data as Map<String, dynamic>),
    );

    return CheckDraftResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
