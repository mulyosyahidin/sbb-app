// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_draft_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveDraftRequestDto _$SaveDraftRequestDtoFromJson(Map<String, dynamic> json) =>
    _SaveDraftRequestDto(
      userName: json['user_name'] as String?,
      userIdentityNumber: json['user_identity_number'] as String?,
      cowId: (json['cow_id'] as num?)?.toInt(),
      cowQuantity: (json['cow_quantity'] as num?)?.toInt(),
      cowTotalPrice: (json['cow_total_price'] as num?)?.toDouble(),
      bankAccountId: (json['bank_account_id'] as num?)?.toInt(),
      program: json['program'] as String?,
      contractMonthDuration: (json['contract_month_duration'] as num?)?.toInt(),
      deleteUserIdentityNumberFile:
          json['delete_user_identity_number_file'] as bool?,
    );

Map<String, dynamic> _$SaveDraftRequestDtoToJson(
        _SaveDraftRequestDto instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_identity_number': instance.userIdentityNumber,
      'cow_id': instance.cowId,
      'cow_quantity': instance.cowQuantity,
      'cow_total_price': instance.cowTotalPrice,
      'bank_account_id': instance.bankAccountId,
      'program': instance.program,
      'contract_month_duration': instance.contractMonthDuration,
      'delete_user_identity_number_file': instance.deleteUserIdentityNumberFile,
    };
