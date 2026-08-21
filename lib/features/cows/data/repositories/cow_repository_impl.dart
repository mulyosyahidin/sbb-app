import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/cows/data/datasources/cow_remote_data_source.dart';
import 'package:app/features/cows/data/dtos/responses/get_cow_by_id_response_dto.dart';
import 'package:app/features/cows/data/dtos/responses/get_cows_response_dto.dart';
import 'package:app/features/cows/domain/repositories/cow_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cow_repository_impl.g.dart';

class CowRepositoryImpl implements CowRepository {
  final CowRemoteDataSource _remoteDataSource;

  CowRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, GetCowsResponseData>> getCows({int page = 1}) async {
    try {
      final responseDto = await _remoteDataSource.getCows(page: page);

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'CowRepositoryImpl.getCows'),
      );
    }
  }

  @override
  Future<Either<Failure, GetCowByIdResponseData>> getCowById(int id) async {
    try {
      final responseDto = await _remoteDataSource.getCowById(id);

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'CowRepositoryImpl.getCowById'),
      );
    }
  }
}

@riverpod
CowRepository cowRepository(Ref ref) {
  return CowRepositoryImpl(
    ref.watch(cowRemoteDataSourceProvider),
  );
}
