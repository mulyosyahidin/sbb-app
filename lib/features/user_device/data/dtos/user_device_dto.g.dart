// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDeviceDto _$UserDeviceDtoFromJson(Map<String, dynamic> json) =>
    _UserDeviceDto(
      id: json['id'] as String,
      fcmToken: json['fcm_token'] as String,
      deviceId: json['device_id'] as String,
      deviceBrand: json['device_brand'] as String,
      deviceModel: json['device_model'] as String,
      osVersion: json['os_version'] as String,
      osBuildId: json['os_build_id'] as String,
    );

Map<String, dynamic> _$UserDeviceDtoToJson(_UserDeviceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fcm_token': instance.fcmToken,
      'device_id': instance.deviceId,
      'device_brand': instance.deviceBrand,
      'device_model': instance.deviceModel,
      'os_version': instance.osVersion,
      'os_build_id': instance.osBuildId,
    };
