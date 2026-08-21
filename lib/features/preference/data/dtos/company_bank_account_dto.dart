import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_bank_account_dto.freezed.dart';
part 'company_bank_account_dto.g.dart';

@freezed
abstract class CompanyBankAccountDto with _$CompanyBankAccountDto {
  const factory CompanyBankAccountDto({
    required String name,
    required String accountNumber,
    required String accountName,
  }) = _CompanyBankAccountDto;

  factory CompanyBankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyBankAccountDtoFromJson(json);
}
