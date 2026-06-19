import 'package:app/core/errors/failure.dart';
import 'package:app/features/preference/data/dtos/responses/get_company_bank_account_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class PreferenceRepository {
  Future<Either<Failure, GetCompanyBankAccountResponseData>> getCompanyBankAccount();
}
