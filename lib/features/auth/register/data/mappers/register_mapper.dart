import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/data/mappers/user_device_mapper.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:app/features/auth/register/domain/entities/register_user.dart';

class RegisterMapper {
  static RegisterUser toEntity(RegisterResponseData data) {
    return RegisterUser(
      user: UserMapper.toEntity(data.userDto),
      userDevice: UserDeviceMapper.toEntity(data.userDeviceDto),
      accessToken: data.accessToken,
    );
  }
}