import 'package:app/core/utils/error_util.dart';
import 'package:app/core/utils/result.dart';
import 'package:app/features/auth/register/data/datasources/register_remote_datasource.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_repository_impl.g.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDatasource _registerRemoteDatasource;

  RegisterRepositoryImpl(this._registerRemoteDatasource);

  @override
  Future<Result<RegisterResponseData>> register(RegisterRequestDto registerRequestDto) async {
    try {
      final response = await _registerRemoteDatasource.register(registerRequestDto);

      return Result.success(response.data!);
    } catch (e) {
      final handledError = ErrorUtil.handleRepositoryException(e, 'RegisterRepositoryImpl');
      
      return Result.failure(handledError as Exception);
    }
  }
}

@riverpod
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    ref.watch(registerRemoteDatasourceProvider),
  );
}
