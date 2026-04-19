import 'package:app/core/utils/error_util.dart';
import 'package:app/core/utils/result.dart';
import 'package:app/features/auth/login/data/datasources/login_remote_datasource.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource _loginRemoteDatasource;

  LoginRepositoryImpl(this._loginRemoteDatasource);

  @override
  Future<Result<LoginResponseData>> login(LoginRequestDto dto) async {
    try {
      final response = await _loginRemoteDatasource.login(dto);

      return Result.success(response.data as LoginResponseData);
    } catch (e) {
      final handledError =
          ErrorUtil.handleRepositoryException(e, 'LoginRepositoryImpl');
      return Result.failure(handledError as Exception);
    }
  }

  @override
  Future<Result<LoginResponseData>> loginWithGoogle(
      GoogleLoginRequestDto dto) async {
    try {
      final response = await _loginRemoteDatasource.loginWithGoogle(dto);

      return Result.success(response.data as LoginResponseData);
    } catch (e) {
      final handledError =
          ErrorUtil.handleRepositoryException(e, 'LoginRepositoryImpl.loginWithGoogle');
      return Result.failure(handledError as Exception);
    }
  }
}

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(ref.watch(loginRemoteDatasourceProvider));
}
