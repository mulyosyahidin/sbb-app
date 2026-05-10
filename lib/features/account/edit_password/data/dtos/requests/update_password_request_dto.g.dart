// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdatePasswordRequestDto _$UpdatePasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _UpdatePasswordRequestDto(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
      newPasswordConfirmation: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$UpdatePasswordRequestDtoToJson(
        _UpdatePasswordRequestDto instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
    };
