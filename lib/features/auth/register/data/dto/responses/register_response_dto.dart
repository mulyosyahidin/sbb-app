import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/data/dtos/user_device_dto.dart';
import 'package:app/core/models/api_response_dto.dart';

class RegisterResponseData {
  final UserDto userDto;
  final String accessToken;
  final UserDeviceDto userDeviceDto;

  RegisterResponseData({
    required this.userDto,
    required this.accessToken,
    required this.userDeviceDto,
  });

  factory RegisterResponseData.fromJson(Map<String, dynamic> json) {
    return RegisterResponseData(
      userDto: UserDto.fromJson(json['user']),
      accessToken: json['access_token'],
      userDeviceDto: UserDeviceDto.fromJson(json['user_device']),
    );
  }
}

class RegisterResponseDto extends ApiResponseDto<RegisterResponseData> {
  RegisterResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => RegisterResponseData.fromJson(data as Map<String, dynamic>),
    );

    return RegisterResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}