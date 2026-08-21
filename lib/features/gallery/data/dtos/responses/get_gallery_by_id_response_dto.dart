import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_dto.dart';

class GetGalleryByIdResponseData {
  final GalleryDto gallery;

  GetGalleryByIdResponseData({
    required this.gallery,
  });

  factory GetGalleryByIdResponseData.fromJson(Map<String, dynamic> json) {
    return GetGalleryByIdResponseData(
      gallery: GalleryDto.fromJson(json['gallery'] as Map<String, dynamic>),
    );
  }
}

class GetGalleryByIdResponseDto extends ApiResponseDto<GetGalleryByIdResponseData> {
  GetGalleryByIdResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetGalleryByIdResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) {
        final dataMap = data as Map<String, dynamic>;
        return GetGalleryByIdResponseData.fromJson(dataMap);
      },
    );

    return GetGalleryByIdResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
