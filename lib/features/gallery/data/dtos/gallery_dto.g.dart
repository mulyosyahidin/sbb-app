// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GalleryDto _$GalleryDtoFromJson(Map<String, dynamic> json) => _GalleryDto(
      id: (json['id'] as num).toInt(),
      tag: json['tag'] as String,
      title: json['title'] as String,
      content: json['content'] as String?,
      featuredImageUrl: json['featured_image_url'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GalleryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metas: (json['metas'] as List<dynamic>?)
          ?.map((e) => GalleryMetaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GalleryDtoToJson(_GalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'title': instance.title,
      'content': instance.content,
      'featured_image_url': instance.featuredImageUrl,
      'items': instance.items,
      'metas': instance.metas,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
