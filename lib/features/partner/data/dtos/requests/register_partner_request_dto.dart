import 'package:json_annotation/json_annotation.dart';

part 'register_partner_request_dto.g.dart';

@JsonSerializable()
class RegisterPartnerRequestDto {
  final String name;
  final String nik;
  final String address;
  final String joinDate;
  final String level;

  RegisterPartnerRequestDto({
    required this.name,
    required this.nik,
    required this.address,
    required this.joinDate,
    required this.level,
  });

  factory RegisterPartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPartnerRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterPartnerRequestDtoToJson(this);
}
