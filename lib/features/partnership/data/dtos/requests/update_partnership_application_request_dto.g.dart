// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_partnership_application_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdatePartnershipApplicationRequestDto
    _$UpdatePartnershipApplicationRequestDtoFromJson(
            Map<String, dynamic> json) =>
        _UpdatePartnershipApplicationRequestDto(
          name: json['name'] as String,
          nik: json['nik'] as String,
          address: json['address'] as String,
          note: json['note'] as String?,
        );

Map<String, dynamic> _$UpdatePartnershipApplicationRequestDtoToJson(
        _UpdatePartnershipApplicationRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'note': instance.note,
    };
