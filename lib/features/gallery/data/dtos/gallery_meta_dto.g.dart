// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GalleryMetaDto _$GalleryMetaDtoFromJson(Map<String, dynamic> json) =>
    _GalleryMetaDto(
      id: (json['id'] as num).toInt(),
      metaIcon: json['meta_icon'] as String,
      metaTitle: json['meta_title'] as String,
      metaContent: json['meta_content'] as String,
    );

Map<String, dynamic> _$GalleryMetaDtoToJson(_GalleryMetaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta_icon': instance.metaIcon,
      'meta_title': instance.metaTitle,
      'meta_content': instance.metaContent,
    };
