import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_partner_request_dto.freezed.dart';
part 'update_partner_request_dto.g.dart';

@freezed
abstract class UpdatePartnerRequestDto with _$UpdatePartnerRequestDto {
  const factory UpdatePartnerRequestDto({
    required String name,
    required String nik,
    required String address,
    required String phoneNumber,
    required String joinDate,
  }) = _UpdatePartnerRequestDto;

  factory UpdatePartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartnerRequestDtoFromJson(json);
}
