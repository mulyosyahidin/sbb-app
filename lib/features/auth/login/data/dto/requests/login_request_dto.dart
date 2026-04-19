import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String email;
  final String password;
  final String fcmToken;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osBuildId;
  final String osVersion;

  LoginRequestDto({
    required this.email,
    required this.password,
    required this.fcmToken,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osBuildId,
    required this.osVersion,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
