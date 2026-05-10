// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_partner_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterPartnerRequestDto _$RegisterPartnerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _RegisterPartnerRequestDto(
      name: json['name'] as String,
      nik: json['nik'] as String,
      address: json['address'] as String,
      joinDate: json['join_date'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$RegisterPartnerRequestDtoToJson(
        _RegisterPartnerRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'join_date': instance.joinDate,
      'level': instance.level,
    };
