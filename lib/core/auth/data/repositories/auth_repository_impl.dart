import 'package:app/core/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/auth/domain/repositories/auth_repository.dart';
import 'package:app/core/utils/result.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(this._authRemoteDatasource);

  @override
  Future<Result<GetMeResponseData>> getMe() async {
    try {
      final response = await _authRemoteDatasource.getMe();

      return Result.success(response.data!);
    } catch (e) {
      final handledError = ErrorUtil.handleRepositoryException(e, 'AuthRepositoryImpl');

      return Result.failure(handledError as Exception);
    }
  }

  @override
  Future<Result<void>> logout(String deviceId) async {
    try {
      await _authRemoteDatasource.logout(deviceId);

      return Result.success(null);
    } catch (e) {
      final handledError = ErrorUtil.handleRepositoryException(e, 'AuthRepositoryImpl');
      return Result.failure(handledError as Exception);
    }
  }

  @override
  Future<Result<RefreshAccessTokenResponseData>> refreshToken(String accessToken) async {
    try {
      final response = await _authRemoteDatasource.refreshToken(accessToken);

      return Result.success(response.data!);
    } catch (e) {
      final handledError = ErrorUtil.handleRepositoryException(e, 'AuthRepositoryImpl');
      
      return Result.failure(handledError as Exception);
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDatasourceProvider));
}