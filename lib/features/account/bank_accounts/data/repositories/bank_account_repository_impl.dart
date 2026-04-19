import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/account/bank_accounts/data/datasources/bank_account_remote_datasource.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/create_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/update_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/bank_accounts_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/create_bank_account_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/mark_as_primary_response_dto.dart';
import 'package:app/features/account/bank_accounts/domain/repositories/bank_account_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_account_repository_impl.g.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  final BankAccountRemoteDataSource _dataSource;

  BankAccountRepositoryImpl(this._dataSource);

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
  Future<Either<Failure, BankAccountsResponseData>> getBankAccounts({
    int page = 1,
    int perPage = 10,
    String? search,
  }) async {
    try {
      final response = await _dataSource.getBankAccounts(
        page: page,
        perPage: perPage,
        search: search,
      );

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'BankAccountRepositoryImpl.getBankAccounts'));
    }
  }

  @override
  Future<Either<Failure, MarkAsPrimaryResponseData>> markAsPrimary(String id) async {
    try {
      final response = await _dataSource.markAsPrimary(id);

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'BankAccountRepositoryImpl.markAsPrimary'));
    }
  }

  @override
  Future<Either<Failure, CreateBankAccountResponseData>> createBankAccount(
      CreateBankAccountRequestDto dto) async {
    try {
      final response = await _dataSource.createBankAccount(dto);

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'BankAccountRepositoryImpl.createBankAccount'));
    }
  }

  @override
  Future<Either<Failure, CreateBankAccountResponseData>> updateBankAccount(
      String id, UpdateBankAccountRequestDto dto) async {
    try {
      final response = await _dataSource.updateBankAccount(id, dto);

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'BankAccountRepositoryImpl.updateBankAccount'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBankAccount(String id) async {
    try {
      await _dataSource.deleteBankAccount(id);
      return const Right(null);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'BankAccountRepositoryImpl.deleteBankAccount'));
    }
  }
}

@riverpod
BankAccountRepository bankAccountRepository(Ref ref) {
  return BankAccountRepositoryImpl(ref.watch(bankAccountRemoteDataSourceProvider));
}
