import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_application_dto.dart';

class PartnershipApplicationResponseData {
  final PartnershipApplicationDto application;

  PartnershipApplicationResponseData({
    required this.application,
  });

  factory PartnershipApplicationResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return PartnershipApplicationResponseData(
      application: PartnershipApplicationDto.fromJson(
        json['application'] as Map<String, dynamic>,
      ),
    );
  }
}

class PartnershipApplicationResponse
    extends ApiResponseDto<PartnershipApplicationResponseData> {
  PartnershipApplicationResponse({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory PartnershipApplicationResponse.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => PartnershipApplicationResponseData.fromJson(
        data as Map<String, dynamic>,
      ),
    );

    return PartnershipApplicationResponse(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
