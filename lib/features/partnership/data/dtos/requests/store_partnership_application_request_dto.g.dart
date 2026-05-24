// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_partnership_application_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorePartnershipApplicationRequestDto
    _$StorePartnershipApplicationRequestDtoFromJson(
            Map<String, dynamic> json) =>
        _StorePartnershipApplicationRequestDto(
          level: (json['level'] as num).toInt(),
          name: json['name'] as String,
          nik: json['nik'] as String,
          address: json['address'] as String,
          note: json['note'] as String?,
        );

Map<String, dynamic> _$StorePartnershipApplicationRequestDtoToJson(
        _StorePartnershipApplicationRequestDto instance) =>
    <String, dynamic>{
      'level': instance.level,
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'note': instance.note,
    };
