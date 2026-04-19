// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      fcmToken: json['fcm_token'] as String,
      deviceId: json['device_id'] as String,
      deviceBrand: json['device_brand'] as String,
      deviceModel: json['device_model'] as String,
      osBuildId: json['os_build_id'] as String,
      osVersion: json['os_version'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'device_brand': instance.deviceBrand,
      'device_model': instance.deviceModel,
      'os_build_id': instance.osBuildId,
      'os_version': instance.osVersion,
    };
