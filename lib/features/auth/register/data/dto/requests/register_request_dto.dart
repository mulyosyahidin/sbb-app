import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String passwordConfirmation;
  final String fcmToken;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osBuildId;
  final String osVersion;

  RegisterRequestDto({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirmation,
    required this.fcmToken,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osBuildId,
    required this.osVersion,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}