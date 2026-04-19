import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/auth/register/data/datasources/register_remote_datasource.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_repository_impl.g.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDatasource _registerRemoteDatasource;

  RegisterRepositoryImpl(this._registerRemoteDatasource);

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
  Future<Either<Failure, RegisterResponseData>> register(
      RegisterRequestDto registerRequestDto) async {
    try {
      final response =
          await _registerRemoteDatasource.register(registerRequestDto);

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'RegisterRepositoryImpl'));
    }
  }
}

@riverpod
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    ref.watch(registerRemoteDatasourceProvider),
  );
}
