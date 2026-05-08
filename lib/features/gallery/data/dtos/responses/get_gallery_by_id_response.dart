import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_dto.dart';

class GetGalleryByIdResponse extends ApiResponseDto<GalleryDto> {
  GetGalleryByIdResponse({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetGalleryByIdResponse.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GalleryDto.fromJson(data as Map<String, dynamic>),
    );

    return GetGalleryByIdResponse(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
