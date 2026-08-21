import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/preference/data/datasources/preference_remote_data_source.dart';
import 'package:app/features/preference/data/dtos/responses/get_company_bank_account_response_dto.dart';
import 'package:app/features/preference/domain/repositories/preference_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository_impl.g.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  final PreferenceRemoteDataSource _remoteDataSource;

  PreferenceRepositoryImpl(this._remoteDataSource);

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
  Future<Either<Failure, GetCompanyBankAccountResponseData>>
      getCompanyBankAccount() async {
    try {
      final responseDto = await _remoteDataSource.getCompanyBankAccount();

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(
            e, 'PreferenceRepositoryImpl.getCompanyBankAccount'),
      );
    }
  }
}

@riverpod
PreferenceRepository preferenceRepository(Ref ref) {
  return PreferenceRepositoryImpl(
    ref.watch(preferenceRemoteDataSourceProvider),
  );
}
