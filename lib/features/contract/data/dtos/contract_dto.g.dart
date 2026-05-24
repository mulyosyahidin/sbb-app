// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractDto _$ContractDtoFromJson(Map<String, dynamic> json) => _ContractDto(
      id: (json['id'] as num).toInt(),
      contractNumber: json['contract_number'] as String?,
      userId: (json['user_id'] as num).toInt(),
      userName: json['user_name'] as String?,
      userIdentityNumber: json['user_identity_number'] as String?,
      userIdentityNumberFileId: const IntStringConverter()
          .fromJson(json['user_identity_number_file_id']),
      userIdentityNumberFile: json['user_identity_number_file'] == null
          ? null
          : AppFileDto.fromJson(
              json['user_identity_number_file'] as Map<String, dynamic>),
      cowId: const IntStringConverter().fromJson(json['cow_id']),
      cowImageFileId:
          const IntStringConverter().fromJson(json['cow_image_file_id']),
      cowName: json['cow_name'] as String?,
      cowPrice: const DoubleStringConverter().fromJson(json['cow_price']),
      cowWeightKg: const IntStringConverter().fromJson(json['cow_weight_kg']),
      cowQuantity: const IntStringConverter().fromJson(json['cow_quantity']),
      cowTotalPrice:
          const DoubleStringConverter().fromJson(json['cow_total_price']),
      bankAccountId:
          const IntStringConverter().fromJson(json['bank_account_id']),
      bankName: json['bank_name'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      program: json['program'] as String?,
      contractMonthDuration:
          const IntStringConverter().fromJson(json['contract_month_duration']),
      status: json['status'] as String,
      note: json['note'] as String?,
      profitSharingPercentage: const DoubleStringConverter()
          .fromJson(json['profit_sharing_percentage']),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => ContractNoteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestNote: _readLatestNote(json, 'latest_note') == null
          ? null
          : ContractNoteDto.fromJson(
              _readLatestNote(json, 'latest_note') as Map<String, dynamic>),
      paymentSchedules: (json['payment_schedules'] as List<dynamic>?)
          ?.map((e) => PaymentScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContractDtoToJson(_ContractDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contract_number': instance.contractNumber,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_identity_number': instance.userIdentityNumber,
      'user_identity_number_file_id':
          const IntStringConverter().toJson(instance.userIdentityNumberFileId),
      'user_identity_number_file': instance.userIdentityNumberFile,
      'cow_id': const IntStringConverter().toJson(instance.cowId),
      'cow_image_file_id':
          const IntStringConverter().toJson(instance.cowImageFileId),
      'cow_name': instance.cowName,
      'cow_price': const DoubleStringConverter().toJson(instance.cowPrice),
      'cow_weight_kg': const IntStringConverter().toJson(instance.cowWeightKg),
      'cow_quantity': const IntStringConverter().toJson(instance.cowQuantity),
      'cow_total_price':
          const DoubleStringConverter().toJson(instance.cowTotalPrice),
      'bank_account_id':
          const IntStringConverter().toJson(instance.bankAccountId),
      'bank_name': instance.bankName,
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'program': instance.program,
      'contract_month_duration':
          const IntStringConverter().toJson(instance.contractMonthDuration),
      'status': instance.status,
      'note': instance.note,
      'profit_sharing_percentage': const DoubleStringConverter()
          .toJson(instance.profitSharingPercentage),
      'notes': instance.notes,
      'latest_note': instance.latestNote,
      'payment_schedules': instance.paymentSchedules,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
