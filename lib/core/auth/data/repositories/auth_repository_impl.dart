import 'package:app/core/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/auth/domain/repositories/auth_repository.dart';
import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(this._authRemoteDatasource);

  Failure _mapExceptionToFailure(Object e, String reason) {
    final handled = ErrorUtil.handleRepositoryException(e, reason);
    if (handled is ApiException) {
      return ValidationFailure(handled.message, errors: handled.errors);
    }
    if (handled is DataException) {
      return ServerFailure(handled.message, code: handled.code);
    }
    return ServerFailure(
      handled.toString(),
    );
  }

  @override
  Future<Either<Failure, GetMeResponseData>> getMe() async {
    try {
      final response = await _authRemoteDatasource.getMe();

      return Right(response.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'AuthRepositoryImpl.getMe'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout(int deviceId) async {
    try {
      await _authRemoteDatasource.logout(deviceId);

      return const Right(null);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'AuthRepositoryImpl.logout'),
      );
    }
  }

  @override
  Future<Either<Failure, RefreshAccessTokenResponseData>> refreshToken(
      String accessToken) async {
    try {
      final response = await _authRemoteDatasource.refreshToken(accessToken);

      return Right(response.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'AuthRepositoryImpl.refreshToken'),
      );
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDatasourceProvider),
  );
}
