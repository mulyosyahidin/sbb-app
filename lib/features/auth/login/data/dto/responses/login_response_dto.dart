import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/data/dtos/user_device_dto.dart';
import 'package:app/core/models/api_response_dto.dart';

class LoginResponseData {
  final UserDto userDto;
  final String accessToken;
  final UserDeviceDto userDeviceDto;

  LoginResponseData({
    required this.userDto,
    required this.accessToken,
    required this.userDeviceDto,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      userDto: UserDto.fromJson(json['user']),
      accessToken: json['access_token'],
      userDeviceDto: UserDeviceDto.fromJson(json['user_device']),
    );
  }
}

class LoginResponseDto extends ApiResponseDto<LoginResponseData> {
  LoginResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
    );

    return LoginResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
