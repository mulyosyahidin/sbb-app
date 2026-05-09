// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      profilePictureFileId: (json['profile_picture_file_id'] as num?)?.toInt(),
      role: json['role'] as String?,
      profilePictureUrl: json['profile_picture_url'] as String?,
      driver: json['driver'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      twoFactorConfirmedAt: json['two_factor_confirmed_at'] == null
          ? null
          : DateTime.parse(json['two_factor_confirmed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profile_picture_file_id': instance.profilePictureFileId,
      'role': instance.role,
      'profile_picture_url': instance.profilePictureUrl,
      'driver': instance.driver,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'two_factor_confirmed_at':
          instance.twoFactorConfirmedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
