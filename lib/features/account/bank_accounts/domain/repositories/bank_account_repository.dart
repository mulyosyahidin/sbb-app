import 'package:app/core/errors/failure.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/create_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/update_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/bank_accounts_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/create_bank_account_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/mark_as_primary_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class BankAccountRepository {
  Future<Either<Failure, BankAccountsResponseData>> getBankAccounts({
    int page = 1,
    int perPage = 10,
    String? search,
  });

  Future<Either<Failure, MarkAsPrimaryResponseData>> markAsPrimary(String id);

  Future<Either<Failure, CreateBankAccountResponseData>> createBankAccount(
      CreateBankAccountRequestDto dto);

  Future<Either<Failure, CreateBankAccountResponseData>> updateBankAccount(
      String id, UpdateBankAccountRequestDto dto);

  Future<Either<Failure, void>> deleteBankAccount(String id);
}
