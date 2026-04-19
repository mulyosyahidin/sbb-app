import 'package:json_annotation/json_annotation.dart';

part 'update_bank_account_request_dto.g.dart';

@JsonSerializable()
class UpdateBankAccountRequestDto {
  final String bankName;
  final String accountName;
  final String accountNumber;
  final String? note;
  final bool isPrimary;

  UpdateBankAccountRequestDto({
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
    this.note,
    this.isPrimary = false,
  });

  factory UpdateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBankAccountRequestDtoToJson(this);
}
