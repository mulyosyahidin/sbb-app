import 'package:json_annotation/json_annotation.dart';

part 'create_bank_account_request_dto.g.dart';

@JsonSerializable()
class CreateBankAccountRequestDto {
  final String bankName;
  final String accountName;
  final String accountNumber;
  final String? note;
  final bool isPrimary;

  CreateBankAccountRequestDto({
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
    this.note,
    this.isPrimary = false,
  });

  factory CreateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBankAccountRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBankAccountRequestDtoToJson(this);
}
