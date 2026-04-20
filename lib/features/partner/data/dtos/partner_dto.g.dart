// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerDto _$PartnerDtoFromJson(Map<String, dynamic> json) => PartnerDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      name: json['name'] as String,
      nik: json['nik'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      joinDate: json['join_date'] as String,
      level: json['level'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PartnerDtoToJson(PartnerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'nik': instance.nik,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'join_date': instance.joinDate,
      'level': instance.level,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
