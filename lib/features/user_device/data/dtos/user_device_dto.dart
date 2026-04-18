import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_dto.freezed.dart';
part 'user_device_dto.g.dart';

@freezed
abstract class UserDeviceDto with _$UserDeviceDto {
  const factory UserDeviceDto({
    required String id,
    required String fcmToken,
    required String deviceId,
    required String deviceBrand,
    required String deviceModel,
    required String osVersion,
    required String osBuildId,
  }) = _UserDeviceDto;

  factory UserDeviceDto.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceDtoFromJson(json);
}