import 'package:app/features/preference/data/dtos/company_bank_account_dto.dart';
import 'package:app/features/preference/domain/entities/company_bank_account.dart';

class CompanyBankAccountMapper {
  static CompanyBankAccount toEntity(CompanyBankAccountDto dto) {
    return CompanyBankAccount(
      name: dto.name,
      accountNumber: dto.accountNumber,
      accountName: dto.accountName,
    );
  }
}
