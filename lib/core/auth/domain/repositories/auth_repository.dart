import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, GetMeResponseData>> getMe();
  Future<Either<Failure, RefreshAccessTokenResponseData>> refreshToken(String accessToken);
  Future<Either<Failure, void>> logout(String deviceId);
}
