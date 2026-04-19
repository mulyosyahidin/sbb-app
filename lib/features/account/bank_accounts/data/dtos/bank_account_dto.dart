import 'package:json_annotation/json_annotation.dart';

part 'bank_account_dto.g.dart';

@JsonSerializable()
class BankAccountDto {
  final String id;
  final String userId;
  final bool isPrimary;
  final String accountName;
  final String accountNumber;
  final String bankName;
  final String? note;
  final String createdAt;
  final String updatedAt;

  BankAccountDto({
    required this.id,
    required this.userId,
    required this.isPrimary,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountDtoToJson(this);
}
