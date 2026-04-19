import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/auth/login/data/datasources/login_remote_datasource.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource _loginRemoteDatasource;

  LoginRepositoryImpl(this._loginRemoteDatasource);

  Failure _mapExceptionToFailure(Object e, String reason) {
    final handled = ErrorUtil.handleRepositoryException(e, reason);
    if (handled is ApiException) {
      return ValidationFailure(handled.message, errors: handled.errors);
    }
    if (handled is DataException) {
      return ServerFailure(handled.message, code: handled.code);
    }
    return ServerFailure(handled.toString());
  }

  @override
  Future<Either<Failure, LoginResponseData>> login(LoginRequestDto dto) async {
    try {
      final response = await _loginRemoteDatasource.login(dto);

      return Right(response.data as LoginResponseData);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'LoginRepositoryImpl.login'));
    }
  }

  @override
  Future<Either<Failure, LoginResponseData>> loginWithGoogle(
      GoogleLoginRequestDto dto) async {
    try {
      final response = await _loginRemoteDatasource.loginWithGoogle(dto);

      return Right(response.data as LoginResponseData);
    } catch (e) {
      return Left(
          _mapExceptionToFailure(e, 'LoginRepositoryImpl.loginWithGoogle'));
    }
  }
}

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(ref.watch(loginRemoteDatasourceProvider));
}
