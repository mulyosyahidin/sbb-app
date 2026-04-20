// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerRequestDto _$PartnerRequestDtoFromJson(Map<String, dynamic> json) =>
    PartnerRequestDto(
      name: json['name'] as String,
      nik: json['nik'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      joinDate: json['join_date'] as String,
    );

Map<String, dynamic> _$PartnerRequestDtoToJson(PartnerRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'join_date': instance.joinDate,
    };
