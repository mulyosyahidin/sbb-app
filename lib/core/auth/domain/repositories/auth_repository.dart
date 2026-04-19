import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<GetMeResponseData>> getMe();
  Future<Result<RefreshAccessTokenResponseData>> refreshToken(String accessToken);
  Future<Result<void>> logout(String deviceId);
}
