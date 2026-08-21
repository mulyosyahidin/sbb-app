import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_bank_account_request_dto.freezed.dart';
part 'create_bank_account_request_dto.g.dart';

@freezed
abstract class CreateBankAccountRequestDto with _$CreateBankAccountRequestDto {
  const factory CreateBankAccountRequestDto({
    required String bankName,
    required String accountName,
    required String accountNumber,
    String? note,
    @Default(false) bool isPrimary,
  }) = _CreateBankAccountRequestDto;

  factory CreateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBankAccountRequestDtoFromJson(json);
}
