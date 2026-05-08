// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GalleryItemDto _$GalleryItemDtoFromJson(Map<String, dynamic> json) =>
    _GalleryItemDto(
      id: (json['id'] as num).toInt(),
      caption: json['caption'] as String?,
      imageUrl: json['image_url'] as String,
      featuredImageUrl: json['featured_image_url'] as String?,
    );

Map<String, dynamic> _$GalleryItemDtoToJson(_GalleryItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'image_url': instance.imageUrl,
      'featured_image_url': instance.featuredImageUrl,
    };
