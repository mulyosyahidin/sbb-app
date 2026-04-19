import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/bank_account_dto.dart';

class CreateBankAccountResponseData {
  final BankAccountDto bankAccount;

  CreateBankAccountResponseData({
    required this.bankAccount,
  });

  factory CreateBankAccountResponseData.fromJson(Map<String, dynamic> json) {
    return CreateBankAccountResponseData(
      bankAccount: BankAccountDto.fromJson(json['bank_account']),
    );
  }
}

class CreateBankAccountResponseDto extends ApiResponseDto<CreateBankAccountResponseData> {
  CreateBankAccountResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CreateBankAccountResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CreateBankAccountResponseData.fromJson(data as Map<String, dynamic>),
    );

    return CreateBankAccountResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
