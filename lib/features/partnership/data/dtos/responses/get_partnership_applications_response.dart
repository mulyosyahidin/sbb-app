import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_application_dto.dart';

class GetPartnershipApplicationsResponseData {
  final List<PartnershipApplicationDto> applications;
  final PaginationDto pagination;

  GetPartnershipApplicationsResponseData({
    required this.applications,
    required this.pagination,
  });

  factory GetPartnershipApplicationsResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetPartnershipApplicationsResponseData(
      applications: (json['applications'] as List? ?? const [])
          .map((e) => PartnershipApplicationDto.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList(),
      pagination: PaginationDto.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}

class GetPartnershipApplicationsResponse
    extends ApiResponseDto<GetPartnershipApplicationsResponseData> {
  GetPartnershipApplicationsResponse({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetPartnershipApplicationsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetPartnershipApplicationsResponseData.fromJson(
        data as Map<String, dynamic>,
      ),
    );

    return GetPartnershipApplicationsResponse(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
