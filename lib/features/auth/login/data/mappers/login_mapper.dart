import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/data/mappers/user_device_mapper.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:app/features/auth/login/domain/entity/login_user.dart';

class LoginMapper {
  static LoginUser toEntity(LoginResponseData data) {
    return LoginUser(
      user: UserMapper.toEntity(data.userDto),
      userDevice: UserDeviceMapper.toEntity(data.userDeviceDto),
      accessToken: data.accessToken,
    );
  }
}
