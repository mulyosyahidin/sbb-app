import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/cows/data/dtos/cow_dto.dart';

class GetCowByIdResponseData {
  final CowDto cow;

  GetCowByIdResponseData({
    required this.cow,
  });

  factory GetCowByIdResponseData.fromJson(Map<String, dynamic> json) {
    return GetCowByIdResponseData(
      cow: CowDto.fromJson(json['cow'] as Map<String, dynamic>),
    );
  }
}

class GetCowByIdResponseDto extends ApiResponseDto<GetCowByIdResponseData> {
  GetCowByIdResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetCowByIdResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetCowByIdResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetCowByIdResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
