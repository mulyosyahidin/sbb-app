import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_dto.dart';

class GetGalleriesResponseData {
  final List<GalleryDto> galleries;
  final PaginationDto pagination;

  GetGalleriesResponseData({
    required this.galleries,
    required this.pagination,
  });

  factory GetGalleriesResponseData.fromJson(Map<String, dynamic> json) {
    return GetGalleriesResponseData(
      galleries: (json['galleries'] as List)
          .map((e) => GalleryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }
}

class GetGalleriesResponseDto extends ApiResponseDto<GetGalleriesResponseData> {
  GetGalleriesResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetGalleriesResponseDto.fromJson(Map<String, dynamic> json) {
    final dataMap = {
      'galleries': json['data'] ?? [],
      'pagination': json['meta'] ?? {},
    };

    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetGalleriesResponseData.fromJson(dataMap),
    );

    return GetGalleriesResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
