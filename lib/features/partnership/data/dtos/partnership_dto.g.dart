// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnershipDto _$PartnershipDtoFromJson(Map<String, dynamic> json) =>
    _PartnershipDto(
      id: _intFromJson(json['id']),
      userId: _intFromJson(json['user_id']),
      level: _intFromJson(json['level']),
      levelLabel: _stringFromJson(json['level_label']),
      refferalCode: _nullableStringFromJson(json['refferal_code']),
      approvedAt: _nullableStringFromJson(json['approved_at']),
      approvedBy: json['approved_by'] == null
          ? null
          : PartnershipReviewerDto.fromJson(
              json['approved_by'] as Map<String, dynamic>),
      latestApplication: json['latest_application'] == null
          ? null
          : PartnershipApplicationDto.fromJson(
              json['latest_application'] as Map<String, dynamic>),
      createdAt: _nullableStringFromJson(json['created_at']),
      updatedAt: _nullableStringFromJson(json['updated_at']),
    );

Map<String, dynamic> _$PartnershipDtoToJson(_PartnershipDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'level': instance.level,
      'level_label': instance.levelLabel,
      'refferal_code': instance.refferalCode,
      'approved_at': instance.approvedAt,
      'approved_by': instance.approvedBy,
      'latest_application': instance.latestApplication,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
