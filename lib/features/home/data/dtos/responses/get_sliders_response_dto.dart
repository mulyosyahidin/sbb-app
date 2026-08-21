import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/home/data/dtos/slider_dto.dart';

class GetSlidersResponseData {
  final List<SliderDto> sliders;

  GetSlidersResponseData({
    required this.sliders,
  });

  factory GetSlidersResponseData.fromJson(List<dynamic> json) {
    return GetSlidersResponseData(
      sliders: json
          .map((e) => SliderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetSlidersResponseDto extends ApiResponseDto<GetSlidersResponseData> {
  GetSlidersResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetSlidersResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetSlidersResponseData.fromJson(data as List<dynamic>),
    );

    return GetSlidersResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
