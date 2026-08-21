import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_meta_dto.freezed.dart';
part 'gallery_meta_dto.g.dart';

@freezed
abstract class GalleryMetaDto with _$GalleryMetaDto {
  const factory GalleryMetaDto({
    required int id,
    required String metaIcon,
    required String metaTitle,
    required String metaContent,
  }) = _GalleryMetaDto;

  factory GalleryMetaDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryMetaDtoFromJson(json);
}
