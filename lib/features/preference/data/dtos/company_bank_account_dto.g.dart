// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_bank_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyBankAccountDto _$CompanyBankAccountDtoFromJson(
        Map<String, dynamic> json) =>
    _CompanyBankAccountDto(
      name: json['name'] as String,
      accountNumber: json['account_number'] as String,
      accountName: json['account_name'] as String,
    );

Map<String, dynamic> _$CompanyBankAccountDtoToJson(
        _CompanyBankAccountDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
    };
