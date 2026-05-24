// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnershipIdentityCardFileDto _$PartnershipIdentityCardFileDtoFromJson(
        Map<String, dynamic> json) =>
    _PartnershipIdentityCardFileDto(
      id: _intFromJson(json['id']),
      fileName: _stringFromJson(json['file_name']),
      fileType: _stringFromJson(json['file_type']),
      fileSize: _stringFromJson(json['file_size']),
      fileUrl: _stringFromJson(json['file_url']),
    );

Map<String, dynamic> _$PartnershipIdentityCardFileDtoToJson(
        _PartnershipIdentityCardFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
      'file_url': instance.fileUrl,
    };

_PartnershipApplicationDto _$PartnershipApplicationDtoFromJson(
        Map<String, dynamic> json) =>
    _PartnershipApplicationDto(
      id: _intFromJson(json['id']),
      userId: _intFromJson(json['user_id']),
      fromLevel: _nullableIntFromJson(json['from_level']),
      fromLevelLabel: _nullableStringFromJson(json['from_level_label']),
      toLevel: _intFromJson(json['to_level']),
      toLevelLabel: _stringFromJson(json['to_level_label']),
      type: _stringFromJson(json['type']),
      typeLabel: _stringFromJson(json['type_label']),
      status: _stringFromJson(json['status']),
      statusLabel: _stringFromJson(json['status_label']),
      name: _stringFromJson(json['name']),
      nik: _stringFromJson(json['nik']),
      address: _stringFromJson(json['address']),
      identityCardFile: json['identity_card_file'] == null
          ? null
          : PartnershipIdentityCardFileDto.fromJson(
              json['identity_card_file'] as Map<String, dynamic>),
      note: _nullableStringFromJson(json['note']),
      submittedAt: _nullableStringFromJson(json['submitted_at']),
      lastSubmittedAt: _nullableStringFromJson(json['last_submitted_at']),
      reviewedAt: _nullableStringFromJson(json['reviewed_at']),
      reviewedBy: json['reviewed_by'] == null
          ? null
          : PartnershipReviewerDto.fromJson(
              json['reviewed_by'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => PartnershipApplicationReviewDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: _nullableStringFromJson(json['created_at']),
      updatedAt: _nullableStringFromJson(json['updated_at']),
    );

Map<String, dynamic> _$PartnershipApplicationDtoToJson(
        _PartnershipApplicationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'from_level': instance.fromLevel,
      'from_level_label': instance.fromLevelLabel,
      'to_level': instance.toLevel,
      'to_level_label': instance.toLevelLabel,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'identity_card_file': instance.identityCardFile,
      'note': instance.note,
      'submitted_at': instance.submittedAt,
      'last_submitted_at': instance.lastSubmittedAt,
      'reviewed_at': instance.reviewedAt,
      'reviewed_by': instance.reviewedBy,
      'reviews': instance.reviews,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
