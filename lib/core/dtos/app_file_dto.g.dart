// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppFileDto _$AppFileDtoFromJson(Map<String, dynamic> json) => _AppFileDto(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      fileName: json['file_name'] as String,
      fileType: json['file_type'] as String,
      fileSize: (json['file_size'] as num).toInt(),
      fileUrl: json['file_url'] as String,
    );

Map<String, dynamic> _$AppFileDtoToJson(_AppFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
      'file_url': instance.fileUrl,
    };
