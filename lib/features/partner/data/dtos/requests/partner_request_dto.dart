import 'package:json_annotation/json_annotation.dart';

part 'partner_request_dto.g.dart';

@JsonSerializable()
class PartnerRequestDto {
  final String name;
  final String nik;
  final String address;
  final String phoneNumber;
  final String joinDate;

  PartnerRequestDto({
    required this.name,
    required this.nik,
    required this.address,
    required this.phoneNumber,
    required this.joinDate,
  });

  factory PartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PartnerRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerRequestDtoToJson(this);
}
