import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/user_device/data/dtos/user_device_dto.dart';

class CreateUserDeviceResponseData {
  final UserDeviceDto userDevice;

  CreateUserDeviceResponseData({required this.userDevice});

  factory CreateUserDeviceResponseData.fromJson(Map<String, dynamic> json) =>
      CreateUserDeviceResponseData(
        userDevice: UserDeviceDto.fromJson(json['user_device']),
      );
}

class CreateUserDeviceResponseDto
    extends ApiResponseDto<CreateUserDeviceResponseData> {
  CreateUserDeviceResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CreateUserDeviceResponseDto.fromJson(Map<String, dynamic> json){
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CreateUserDeviceResponseData.fromJson(data as Map<String, dynamic>),
    );

    return CreateUserDeviceResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
    );
  }
}
