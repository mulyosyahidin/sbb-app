import 'package:app/features/gallery/data/dtos/gallery_item_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_meta_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_dto.freezed.dart';
part 'gallery_dto.g.dart';

@freezed
abstract class GalleryDto with _$GalleryDto {
  const factory GalleryDto({
    required int id,
    required String tag,
    required String title,
    String? content,
    String? featuredImageUrl,
    List<GalleryItemDto>? items,
    List<GalleryMetaDto>? metas,
    required String createdAt,
    required String updatedAt,
  }) = _GalleryDto;

  factory GalleryDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryDtoFromJson(json);
}
