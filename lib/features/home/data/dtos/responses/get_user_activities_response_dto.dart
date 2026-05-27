import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/home/data/dtos/user_activity_dto.dart';

class GetUserActivitiesResponseData {
  final List<UserActivityDto> activities;

  GetUserActivitiesResponseData({
    required this.activities,
  });

  factory GetUserActivitiesResponseData.fromJson(Map<String, dynamic> json) {
    return GetUserActivitiesResponseData(
      activities: (json['activities'] as List<dynamic>? ?? [])
          .map((e) => UserActivityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetUserActivitiesResponseDto
    extends ApiResponseDto<GetUserActivitiesResponseData> {
  GetUserActivitiesResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetUserActivitiesResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetUserActivitiesResponseData.fromJson(
        data as Map<String, dynamic>,
      ),
    );

    return GetUserActivitiesResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
