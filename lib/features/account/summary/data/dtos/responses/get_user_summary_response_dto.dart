import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/account/summary/data/dtos/user_summary_dto.dart';

class GetUserSummaryResponseDto extends ApiResponseDto<UserSummaryDto> {
  GetUserSummaryResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetUserSummaryResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => UserSummaryDto.fromJson(data as Map<String, dynamic>),
    );

    return GetUserSummaryResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
