// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractDocumentDto _$ContractDocumentDtoFromJson(Map<String, dynamic> json) =>
    _ContractDocumentDto(
      id: (json['id'] as num).toInt(),
      contractId: (json['contract_id'] as num).toInt(),
      fileId: (json['file_id'] as num).toInt(),
      file: json['file'] == null
          ? null
          : AppFileDto.fromJson(json['file'] as Map<String, dynamic>),
      status: json['status'] as String,
      note: json['note'] as String?,
      verifiedAt: json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContractDocumentDtoToJson(
        _ContractDocumentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contract_id': instance.contractId,
      'file_id': instance.fileId,
      'file': instance.file,
      'status': instance.status,
      'note': instance.note,
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
