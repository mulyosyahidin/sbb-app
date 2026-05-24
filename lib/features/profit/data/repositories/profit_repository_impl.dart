import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/profit/data/datasources/profit_remote_data_source.dart';
import 'package:app/features/profit/data/dtos/responses/get_profit_response_dto.dart';
import 'package:app/features/profit/domain/repositories/profit_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class ProfitRepositoryImpl implements ProfitRepository {
  final ProfitRemoteDataSource _remoteDataSource;

  ProfitRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, GetProfitResponseData>> getProfit() async {
    try {
      final responseDto = await _remoteDataSource.getProfit();
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ProfitRepositoryImpl.getProfit'),
      );
    }
  }
}

final profitRepositoryProvider = Provider<ProfitRepository>((ref) {
  return ProfitRepositoryImpl(ref.watch(profitRemoteDataSourceProvider));
});
