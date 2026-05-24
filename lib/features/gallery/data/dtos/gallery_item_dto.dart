import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_dto.freezed.dart';
part 'gallery_item_dto.g.dart';

@freezed
abstract class GalleryItemDto with _$GalleryItemDto {
  const factory GalleryItemDto({
    required int id,
    String? caption,
    String? imageUrl,
    String? featuredImageUrl,
  }) = _GalleryItemDto;

  factory GalleryItemDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryItemDtoFromJson(json);
}
