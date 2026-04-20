import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/partner/data/dtos/partner_dto.dart';

class GetPartnerResponseData {
  final PartnerDto partner;

  GetPartnerResponseData({
    required this.partner,
  });

  factory GetPartnerResponseData.fromJson(Map<String, dynamic> json) {
    return GetPartnerResponseData(
      partner: PartnerDto.fromJson(json['partner']),
    );
  }
}

class GetPartnerResponseDto extends ApiResponseDto<GetPartnerResponseData> {
  GetPartnerResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetPartnerResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetPartnerResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetPartnerResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
