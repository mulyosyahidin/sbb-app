// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_account_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateBankAccountRequestDto _$UpdateBankAccountRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _UpdateBankAccountRequestDto(
      bankName: json['bank_name'] as String,
      accountName: json['account_name'] as String,
      accountNumber: json['account_number'] as String,
      note: json['note'] as String?,
      isPrimary: json['is_primary'] as bool? ?? false,
    );

Map<String, dynamic> _$UpdateBankAccountRequestDtoToJson(
        _UpdateBankAccountRequestDto instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'note': instance.note,
      'is_primary': instance.isPrimary,
    };
