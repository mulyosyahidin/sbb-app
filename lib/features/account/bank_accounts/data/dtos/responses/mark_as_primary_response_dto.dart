import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/bank_account_dto.dart';

class MarkAsPrimaryResponseData {
  final BankAccountDto bankAccount;

  MarkAsPrimaryResponseData({
    required this.bankAccount,
  });

  factory MarkAsPrimaryResponseData.fromJson(Map<String, dynamic> json) {
    return MarkAsPrimaryResponseData(
      bankAccount: BankAccountDto.fromJson(json['bank_account']),
    );
  }
}

class MarkAsPrimaryResponseDto extends ApiResponseDto<MarkAsPrimaryResponseData> {
  MarkAsPrimaryResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory MarkAsPrimaryResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => MarkAsPrimaryResponseData.fromJson(data as Map<String, dynamic>),
    );

    return MarkAsPrimaryResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
