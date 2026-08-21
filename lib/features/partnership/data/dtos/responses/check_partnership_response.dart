import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_application_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_dto.dart';

class CheckPartnershipResponseData {
  final bool hasPartner;
  final int? level;
  final String? levelLabel;
  final PartnershipDto? partnership;
  final PartnershipApplicationDto? pendingApplication;

  CheckPartnershipResponseData({
    required this.hasPartner,
    this.level,
    this.levelLabel,
    this.partnership,
    this.pendingApplication,
  });

  factory CheckPartnershipResponseData.fromJson(Map<String, dynamic> json) {
    return CheckPartnershipResponseData(
      hasPartner: json['has_partner'] == true,
      level:
          json['level'] == null ? null : int.tryParse(json['level'].toString()),
      levelLabel: json['level_label']?.toString(),
      partnership: json['partnership'] == null
          ? null
          : PartnershipDto.fromJson(
              json['partnership'] as Map<String, dynamic>),
      pendingApplication: json['pending_application'] == null
          ? null
          : PartnershipApplicationDto.fromJson(
              json['pending_application'] as Map<String, dynamic>,
            ),
    );
  }
}

class CheckPartnershipResponse
    extends ApiResponseDto<CheckPartnershipResponseData> {
  CheckPartnershipResponse({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CheckPartnershipResponse.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CheckPartnershipResponseData.fromJson(
        data as Map<String, dynamic>,
      ),
    );

    return CheckPartnershipResponse(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
