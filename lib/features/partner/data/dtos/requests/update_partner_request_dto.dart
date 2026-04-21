import 'package:json_annotation/json_annotation.dart';

part 'update_partner_request_dto.g.dart';

@JsonSerializable()
class UpdatePartnerRequestDto {
  final String name;
  final String nik;
  final String address;
  final String phoneNumber;
  final String joinDate;

  UpdatePartnerRequestDto({
    required this.name,
    required this.nik,
    required this.address,
    required this.phoneNumber,
    required this.joinDate,
  });

  factory UpdatePartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartnerRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePartnerRequestDtoToJson(this);
}
