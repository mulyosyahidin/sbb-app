import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/domain/entities/refresh_token_user.dart';
import 'package:app/core/auth/domain/entities/user.dart';

class AuthMapper {
  static RefreshTokenUser toRefreshTokenUser(RefreshAccessTokenResponseData data) {
    return RefreshTokenUser(
      accessToken: data.accessToken,
    );
  }

  static User toUser(GetMeResponseData data) {
    return UserMapper.toEntity(data.userDto);
  }
}
