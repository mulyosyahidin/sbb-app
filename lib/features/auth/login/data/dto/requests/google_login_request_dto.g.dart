// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginRequestDto _$GoogleLoginRequestDtoFromJson(
        Map<String, dynamic> json) =>
    GoogleLoginRequestDto(
      idToken: json['id_token'] as String,
      fcmToken: json['fcm_token'] as String,
      deviceId: json['device_id'] as String,
      deviceBrand: json['device_brand'] as String,
      deviceModel: json['device_model'] as String,
      osBuildId: json['os_build_id'] as String,
      osVersion: json['os_version'] as String,
    );

Map<String, dynamic> _$GoogleLoginRequestDtoToJson(
        GoogleLoginRequestDto instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'device_brand': instance.deviceBrand,
      'device_model': instance.deviceModel,
      'os_build_id': instance.osBuildId,
      'os_version': instance.osVersion,
    };
