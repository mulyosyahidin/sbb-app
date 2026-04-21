// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_partner_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePartnerRequestDto _$UpdatePartnerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePartnerRequestDto(
      name: json['name'] as String,
      nik: json['nik'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      joinDate: json['join_date'] as String,
    );

Map<String, dynamic> _$UpdatePartnerRequestDtoToJson(
        UpdatePartnerRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nik': instance.nik,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'join_date': instance.joinDate,
    };
