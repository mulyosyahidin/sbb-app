import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/bank_account_dto.dart';

class BankAccountsResponseData {
  final List<BankAccountDto> bankAccounts;
  final PaginationDto pagination;

  BankAccountsResponseData({
    required this.bankAccounts,
    required this.pagination,
  });

  factory BankAccountsResponseData.fromJson(Map<String, dynamic> json) {
    return BankAccountsResponseData(
      bankAccounts: (json['bank_accounts'] as List)
          .map(
            (e) => BankAccountDto.fromJson(e),
          )
          .toList(),
      pagination: PaginationDto.fromJson(json['pagination']),
    );
  }
}

class BankAccountsResponseDto extends ApiResponseDto<BankAccountsResponseData> {
  BankAccountsResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory BankAccountsResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => BankAccountsResponseData.fromJson(data as Map<String, dynamic>),
    );

    return BankAccountsResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
