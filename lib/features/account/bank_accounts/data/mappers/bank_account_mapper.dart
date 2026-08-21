import 'package:app/features/account/bank_accounts/data/dtos/bank_account_dto.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';

class BankAccountMapper {
  static BankAccount toEntity(BankAccountDto dto) {
    return BankAccount(
      id: dto.id,
      userId: dto.userId,
      isPrimary: dto.isPrimary,
      accountName: dto.accountName,
      accountNumber: dto.accountNumber,
      bankName: dto.bankName,
      note: dto.note,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
    );
  }

  static List<BankAccount> toEntityList(List<BankAccountDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
