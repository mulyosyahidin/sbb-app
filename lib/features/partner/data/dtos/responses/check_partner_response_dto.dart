import 'package:app/core/models/api_response_dto.dart';

class CheckPartnerResponseData {
  final bool hasPartner;

  CheckPartnerResponseData({
    required this.hasPartner,
  });

  factory CheckPartnerResponseData.fromJson(Map<String, dynamic> json) {
    return CheckPartnerResponseData(
      hasPartner: json['has_partner'] as bool,
    );
  }
}

class CheckPartnerResponseDto extends ApiResponseDto<CheckPartnerResponseData> {
  CheckPartnerResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CheckPartnerResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CheckPartnerResponseData.fromJson(data as Map<String, dynamic>),
    );

    return CheckPartnerResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
