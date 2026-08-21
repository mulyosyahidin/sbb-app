import 'package:app/core/errors/failure.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseData>> login(LoginRequestDto dto);
  Future<Either<Failure, LoginResponseData>> loginWithGoogle(
      GoogleLoginRequestDto dto);
}
