import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/preference/data/dtos/company_bank_account_dto.dart';

class GetCompanyBankAccountResponseData {
  final CompanyBankAccountDto bankAccount;

  GetCompanyBankAccountResponseData({
    required this.bankAccount,
  });

  factory GetCompanyBankAccountResponseData.fromJson(Map<String, dynamic> json) {
    return GetCompanyBankAccountResponseData(
      bankAccount: CompanyBankAccountDto.fromJson(json['bank_account'] as Map<String, dynamic>),
    );
  }
}

class GetCompanyBankAccountResponseDto extends ApiResponseDto<GetCompanyBankAccountResponseData> {
  GetCompanyBankAccountResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetCompanyBankAccountResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetCompanyBankAccountResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetCompanyBankAccountResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
