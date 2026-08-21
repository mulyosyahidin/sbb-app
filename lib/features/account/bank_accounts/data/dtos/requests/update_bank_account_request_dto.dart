import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_bank_account_request_dto.freezed.dart';
part 'update_bank_account_request_dto.g.dart';

@freezed
abstract class UpdateBankAccountRequestDto with _$UpdateBankAccountRequestDto {
  const factory UpdateBankAccountRequestDto({
    required String bankName,
    required String accountName,
    required String accountNumber,
    String? note,
    @Default(false) bool isPrimary,
  }) = _UpdateBankAccountRequestDto;

  factory UpdateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountRequestDtoFromJson(json);
}
