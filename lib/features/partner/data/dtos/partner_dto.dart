import 'package:json_annotation/json_annotation.dart';

part 'partner_dto.g.dart';

@JsonSerializable()
class PartnerDto {
  final String id;
  final String userId;
  final String name;
  final String nik;
  final String phoneNumber;
  final String address;
  final String joinDate;
  final String level;
  final DateTime createdAt;
  final DateTime updatedAt;

  PartnerDto({
    required this.id,
    required this.userId,
    required this.name,
    required this.nik,
    required this.phoneNumber,
    required this.address,
    required this.joinDate,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PartnerDto.fromJson(Map<String, dynamic> json) =>
      _$PartnerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerDtoToJson(this);
}
