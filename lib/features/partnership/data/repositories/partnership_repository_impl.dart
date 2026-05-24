import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/partnership/data/datasources/partnership_remote_data_source.dart';
import 'package:app/features/partnership/data/dtos/requests/store_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/requests/update_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/responses/check_partnership_response.dart';
import 'package:app/features/partnership/data/dtos/responses/get_partnership_applications_response.dart';
import 'package:app/features/partnership/data/dtos/responses/partnership_application_response.dart';
import 'package:app/features/partnership/domain/repositories/partnership_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partnership_repository_impl.g.dart';

class PartnershipRepositoryImpl implements PartnershipRepository {
  final PartnershipRemoteDataSource _remoteDataSource;

  PartnershipRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, CheckPartnershipResponseData>>
      checkPartnership() async {
    try {
      final responseDto = await _remoteDataSource.checkPartnership();
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'PartnershipRepositoryImpl.checkPartnership'),
      );
    }
  }

  @override
  Future<Either<Failure, GetPartnershipApplicationsResponseData>>
      getApplications({int perPage = 10}) async {
    try {
      final responseDto = await _remoteDataSource.getApplications(
        perPage: perPage,
      );
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'PartnershipRepositoryImpl.getApplications'),
      );
    }
  }

  @override
  Future<Either<Failure, PartnershipApplicationResponseData>> storeApplication(
    StorePartnershipApplicationRequestDto request,
  ) async {
    try {
      final responseDto = await _remoteDataSource.storeApplication(request);
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'PartnershipRepositoryImpl.storeApplication'),
      );
    }
  }

  @override
  Future<Either<Failure, PartnershipApplicationResponseData>>
      getApplicationById(int id) async {
    try {
      final responseDto = await _remoteDataSource.getApplicationById(id);
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(
          e,
          'PartnershipRepositoryImpl.getApplicationById',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, PartnershipApplicationResponseData>>
      updateApplication({
    required int id,
    required UpdatePartnershipApplicationRequestDto request,
  }) async {
    try {
      final responseDto = await _remoteDataSource.updateApplication(
        id: id,
        request: request,
      );
      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(
          e,
          'PartnershipRepositoryImpl.updateApplication',
        ),
      );
    }
  }
}

@riverpod
PartnershipRepository partnershipRepository(Ref ref) {
  return PartnershipRepositoryImpl(
    ref.watch(partnershipRemoteDataSourceProvider),
  );
}
