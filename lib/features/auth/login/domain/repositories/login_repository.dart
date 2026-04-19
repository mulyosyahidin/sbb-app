import 'package:app/core/utils/result.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';

abstract class LoginRepository {
  Future<Result<LoginResponseData>> login(LoginRequestDto dto);
  Future<Result<LoginResponseData>> loginWithGoogle(GoogleLoginRequestDto dto);
}
