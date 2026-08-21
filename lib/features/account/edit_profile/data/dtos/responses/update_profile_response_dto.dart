import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/models/api_response_dto.dart';

class UpdateProfileResponseData {
  final UserDto userDto;

  UpdateProfileResponseData({
    required this.userDto,
  });

  factory UpdateProfileResponseData.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseData(
      userDto: UserDto.fromJson(json['user']),
    );
  }
}

class UpdateProfileResponseDto extends ApiResponseDto<UpdateProfileResponseData> {
  UpdateProfileResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory UpdateProfileResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => UpdateProfileResponseData.fromJson(data as Map<String, dynamic>),
    );

    return UpdateProfileResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
