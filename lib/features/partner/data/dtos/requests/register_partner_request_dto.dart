import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_partner_request_dto.freezed.dart';
part 'register_partner_request_dto.g.dart';

@freezed
abstract class RegisterPartnerRequestDto with _$RegisterPartnerRequestDto {
  const factory RegisterPartnerRequestDto({
    required String name,
    required String nik,
    required String address,
    required String joinDate,
    required String level,
  }) = _RegisterPartnerRequestDto;

  factory RegisterPartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPartnerRequestDtoFromJson(json);
}
