import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/cows/data/dtos/cow_dto.dart';

class GetCowsResponseData {
  final List<CowDto> cows;
  final PaginationDto pagination;

  GetCowsResponseData({
    required this.cows,
    required this.pagination,
  });

  factory GetCowsResponseData.fromJson(Map<String, dynamic> json) {
    return GetCowsResponseData(
      cows: (json['cows'] as List)
          .map((e) => CowDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }
}

class GetCowsResponseDto extends ApiResponseDto<GetCowsResponseData> {
  GetCowsResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetCowsResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetCowsResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetCowsResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
