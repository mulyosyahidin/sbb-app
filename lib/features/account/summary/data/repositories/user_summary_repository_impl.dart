import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/account/summary/data/datasources/user_summary_remote_data_source.dart';
import 'package:app/features/account/summary/data/dtos/user_summary_dto.dart';
import 'package:app/features/account/summary/domain/repositories/user_summary_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class UserSummaryRepositoryImpl implements UserSummaryRepository {
  final UserSummaryRemoteDataSource _remoteDataSource;

  UserSummaryRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, UserSummaryDto>> getUserSummary() async {
    try {
      final responseDto = await _remoteDataSource.getUserSummary();
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'UserSummaryRepositoryImpl.getUserSummary'),
      );
    }
  }
}

final userSummaryRepositoryProvider = Provider<UserSummaryRepository>((ref) {
  return UserSummaryRepositoryImpl(
    ref.watch(userSummaryRemoteDataSourceProvider),
  );
});
