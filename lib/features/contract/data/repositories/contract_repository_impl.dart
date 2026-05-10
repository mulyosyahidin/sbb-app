import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/contract/data/datasources/contract_remote_data_source.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contracts_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_draft_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/save_contract_draft_response_dto.dart';
import 'package:app/features/contract/domain/repositories/contract_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_repository_impl.g.dart';

class ContractRepositoryImpl implements ContractRepository {
  final ContractRemoteDataSource _remoteDataSource;

  ContractRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, bool>> checkDraft() async {
    try {
      final result = await _remoteDataSource.checkDraft();
      return Right(result.data?.hasDraft ?? false);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ContractRepositoryImpl.checkDraft'),
      );
    }
  }

  @override
  Future<Either<Failure, GetDraftContractResponseData>>
      getDraftContract() async {
    try {
      final responseDto = await _remoteDataSource.getDraftContract();

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ContractRepositoryImpl.getDraftContract'),
      );
    }
  }

  @override
  Future<Either<Failure, SaveContractDraftResponseData>> saveDraft(
    SaveDraftRequestDto request,
  ) async {
    try {
      final responseDto = await _remoteDataSource.saveDraft(request);

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ContractRepositoryImpl.saveDraft'),
      );
    }
  }

  @override
  Future<Either<Failure, SaveContractDraftResponseData>>
      submitContract() async {
    try {
      final responseDto = await _remoteDataSource.submitContract();

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ContractRepositoryImpl.submitContract'),
      );
    }
  }

  @override
  Future<Either<Failure, GetContractsResponseData>> getContracts({
    int page = 1,
    String? status,
  }) async {
    try {
      final responseDto = await _remoteDataSource.getContracts(
        page: page,
        status: status,
      );

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'ContractRepositoryImpl.getContracts'),
      );
    }
  }
}

@riverpod
ContractRepository contractRepository(Ref ref) {
  return ContractRepositoryImpl(
    ref.watch(contractRemoteDataSourceProvider),
  );
}
