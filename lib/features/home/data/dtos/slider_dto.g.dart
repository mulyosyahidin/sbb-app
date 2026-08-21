// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SliderDto _$SliderDtoFromJson(Map<String, dynamic> json) => _SliderDto(
      id: (json['id'] as num).toInt(),
      tag: json['tag'] as String,
      title: json['title'] as String,
      subTitle: json['sub_title'] as String,
      imageUrl: json['image_url'] as String,
      url: json['url'] as String?,
      sequence: (json['sequence'] as num).toInt(),
    );

Map<String, dynamic> _$SliderDtoToJson(_SliderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'image_url': instance.imageUrl,
      'url': instance.url,
      'sequence': instance.sequence,
    };
