// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankAccountDto _$BankAccountDtoFromJson(Map<String, dynamic> json) =>
    _BankAccountDto(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      isPrimary: json['is_primary'] as bool,
      accountName: json['account_name'] as String,
      accountNumber: json['account_number'] as String,
      bankName: json['bank_name'] as String,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$BankAccountDtoToJson(_BankAccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'is_primary': instance.isPrimary,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'bank_name': instance.bankName,
      'note': instance.note,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
