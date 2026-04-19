import 'package:app/core/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app/core/auth/data/mappers/auth_mapper.dart';
import 'package:app/core/auth/domain/entities/refresh_token_user.dart';
import 'package:app/core/auth/domain/entities/user.dart';
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
  Future<Result<User>> getMe() async {
    try {
      final response = await _authRemoteDatasource.getMe();
      return Result.success(AuthMapper.toUser(response.data!));
    } catch (e) {
      final handledError = ErrorUtil.handleRepositoryException(e, 'AuthRepositoryImpl');

      return Result.failure(handledError as Exception);
    }
  }

  @override
  Future<Result<RefreshTokenUser>> refreshToken(String accessToken) async {
    try {
      final response = await _authRemoteDatasource.refreshToken(accessToken);
      return Result.success(AuthMapper.toRefreshTokenUser(response.data!));
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