import 'package:json_annotation/json_annotation.dart';

part 'google_login_request_dto.g.dart';

@JsonSerializable()
class GoogleLoginRequestDto {
  final String idToken;
  final String fcmToken;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osBuildId;
  final String osVersion;

  GoogleLoginRequestDto({
    required this.idToken,
    required this.fcmToken,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osBuildId,
    required this.osVersion,
  });

  factory GoogleLoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLoginRequestDtoToJson(this);
}
