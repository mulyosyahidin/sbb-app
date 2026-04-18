import 'package:json_annotation/json_annotation.dart';

part 'create_user_device_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateUserDeviceRequest {
  final String fcmToken;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osBuildId;
  final String osVersion;

  CreateUserDeviceRequest({
    required this.fcmToken,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osBuildId,
    required this.osVersion,
  });

  factory CreateUserDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserDeviceRequestToJson(this);
}
