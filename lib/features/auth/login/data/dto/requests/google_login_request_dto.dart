import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_login_request_dto.freezed.dart';
part 'google_login_request_dto.g.dart';

@freezed
abstract class GoogleLoginRequestDto with _$GoogleLoginRequestDto {
  const factory GoogleLoginRequestDto({
    required String idToken,
    required String fcmToken,
    required String deviceId,
    required String deviceBrand,
    required String deviceModel,
    required String osBuildId,
    required String osVersion,
  }) = _GoogleLoginRequestDto;

  factory GoogleLoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestDtoFromJson(json);
}
