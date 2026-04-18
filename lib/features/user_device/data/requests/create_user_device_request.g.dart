// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserDeviceRequest _$CreateUserDeviceRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUserDeviceRequest(
      fcmToken: json['fcm_token'] as String,
      deviceId: json['device_id'] as String,
      deviceBrand: json['device_brand'] as String,
      deviceModel: json['device_model'] as String,
      osBuildId: json['os_build_id'] as String,
      osVersion: json['os_version'] as String,
    );

Map<String, dynamic> _$CreateUserDeviceRequestToJson(
        CreateUserDeviceRequest instance) =>
    <String, dynamic>{
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'device_brand': instance.deviceBrand,
      'device_model': instance.deviceModel,
      'os_build_id': instance.osBuildId,
      'os_version': instance.osVersion,
    };
