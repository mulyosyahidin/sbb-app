import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_partnership_application_request_dto.freezed.dart';
part 'update_partnership_application_request_dto.g.dart';

@freezed
abstract class UpdatePartnershipApplicationRequestDto
    with _$UpdatePartnershipApplicationRequestDto {
  const UpdatePartnershipApplicationRequestDto._();

  const factory UpdatePartnershipApplicationRequestDto({
    required String name,
    required String nik,
    required String address,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? identityCardFile,
    String? note,
  }) = _UpdatePartnershipApplicationRequestDto;

  factory UpdatePartnershipApplicationRequestDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UpdatePartnershipApplicationRequestDtoFromJson(json);

  Map<String, dynamic> toFormMap() {
    final map = toJson();
    if (note == null || note!.trim().isEmpty) {
      map.remove('note');
    }
    return map;
  }
}
