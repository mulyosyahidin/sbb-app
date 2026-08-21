// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserActivityDto _$UserActivityDtoFromJson(Map<String, dynamic> json) =>
    _UserActivityDto(
      id: (json['id'] as num).toInt(),
      iconName: json['icon_name'] as String,
      color: json['color'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      highlightedText: json['highlighted_text'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserActivityDtoToJson(_UserActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon_name': instance.iconName,
      'color': instance.color,
      'title': instance.title,
      'description': instance.description,
      'highlighted_text': instance.highlightedText,
      'data': instance.data,
      'created_at': instance.createdAt.toIso8601String(),
    };
