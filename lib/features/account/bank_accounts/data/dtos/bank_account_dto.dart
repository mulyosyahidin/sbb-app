import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_dto.freezed.dart';
part 'bank_account_dto.g.dart';

@freezed
abstract class BankAccountDto with _$BankAccountDto {
  const factory BankAccountDto({
    required String id,
    required String userId,
    required bool isPrimary,
    required String accountName,
    required String accountNumber,
    required String bankName,
    String? note,
    required String createdAt,
    required String updatedAt,
  }) = _BankAccountDto;

  factory BankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDtoFromJson(json);
}
