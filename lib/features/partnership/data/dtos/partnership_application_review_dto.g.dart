// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_application_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnershipReviewerDto _$PartnershipReviewerDtoFromJson(
        Map<String, dynamic> json) =>
    _PartnershipReviewerDto(
      id: _intFromJson(json['id']),
      name: _stringFromJson(json['name']),
    );

Map<String, dynamic> _$PartnershipReviewerDtoToJson(
        _PartnershipReviewerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_PartnershipApplicationReviewDto _$PartnershipApplicationReviewDtoFromJson(
        Map<String, dynamic> json) =>
    _PartnershipApplicationReviewDto(
      id: _intFromJson(json['id']),
      status: _stringFromJson(json['status']),
      statusLabel: _stringFromJson(json['status_label']),
      note: _nullableStringFromJson(json['note']),
      dataSnapshot: _nullableStringFromJson(json['data_snapshot']),
      reviewedAt: _nullableStringFromJson(json['reviewed_at']),
      reviewedBy: json['reviewed_by'] == null
          ? null
          : PartnershipReviewerDto.fromJson(
              json['reviewed_by'] as Map<String, dynamic>),
      createdAt: _nullableStringFromJson(json['created_at']),
      updatedAt: _nullableStringFromJson(json['updated_at']),
    );

Map<String, dynamic> _$PartnershipApplicationReviewDtoToJson(
        _PartnershipApplicationReviewDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'note': instance.note,
      'data_snapshot': instance.dataSnapshot,
      'reviewed_at': instance.reviewedAt,
      'reviewed_by': instance.reviewedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
