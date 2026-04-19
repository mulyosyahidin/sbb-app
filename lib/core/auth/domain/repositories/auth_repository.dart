import 'package:app/core/auth/domain/entities/refresh_token_user.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<User>> getMe();
  Future<Result<RefreshTokenUser>> refreshToken(String accessToken);
}
