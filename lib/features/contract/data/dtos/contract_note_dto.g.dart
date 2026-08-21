// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractNoteDto _$ContractNoteDtoFromJson(Map<String, dynamic> json) =>
    _ContractNoteDto(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      contractId: (json['contract_id'] as num).toInt(),
      note: json['note'] as String,
      dataAfter: json['data_after'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContractNoteDtoToJson(_ContractNoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'contract_id': instance.contractId,
      'note': instance.note,
      'data_after': instance.dataAfter,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
