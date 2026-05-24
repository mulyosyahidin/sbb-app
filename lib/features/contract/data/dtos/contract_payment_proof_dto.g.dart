// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_payment_proof_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractPaymentProofDto _$ContractPaymentProofDtoFromJson(
        Map<String, dynamic> json) =>
    _ContractPaymentProofDto(
      id: const IntStringConverter().fromJson(json['id']),
      contractId: const IntStringConverter().fromJson(json['contract_id']),
      fileId: const IntStringConverter().fromJson(json['file_id']),
      file: json['file'] == null
          ? null
          : AppFileDto.fromJson(json['file'] as Map<String, dynamic>),
      bankName: json['bank_name'] as String,
      bankAccountName: json['bank_account_name'] as String,
      bankAccountNumber: json['bank_account_number'] as String,
      nominal: const DoubleStringConverter().fromJson(json['nominal']),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContractPaymentProofDtoToJson(
        _ContractPaymentProofDto instance) =>
    <String, dynamic>{
      'id': const IntStringConverter().toJson(instance.id),
      'contract_id': const IntStringConverter().toJson(instance.contractId),
      'file_id': const IntStringConverter().toJson(instance.fileId),
      'file': instance.file,
      'bank_name': instance.bankName,
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'nominal': const DoubleStringConverter().toJson(instance.nominal),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
