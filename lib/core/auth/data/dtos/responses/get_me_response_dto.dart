import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/models/api_response_dto.dart';

class GetMeResponseData {
  final UserDto userDto;

  GetMeResponseData({required this.userDto});

  factory GetMeResponseData.fromJson(Map<String, dynamic> json) {
    return GetMeResponseData(
      userDto: UserDto.fromJson(json['user']),
    );
  }
}

class GetMeResponseDto extends ApiResponseDto<GetMeResponseData> {
  GetMeResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetMeResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetMeResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetMeResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
