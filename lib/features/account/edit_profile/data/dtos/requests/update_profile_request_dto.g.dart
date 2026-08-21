// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileRequestDto _$UpdateProfileRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _UpdateProfileRequestDto(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UpdateProfileRequestDtoToJson(
        _UpdateProfileRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
