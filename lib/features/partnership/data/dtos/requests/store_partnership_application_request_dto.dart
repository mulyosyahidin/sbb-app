import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_partnership_application_request_dto.freezed.dart';
part 'store_partnership_application_request_dto.g.dart';

@freezed
abstract class StorePartnershipApplicationRequestDto
    with _$StorePartnershipApplicationRequestDto {
  const StorePartnershipApplicationRequestDto._();

  const factory StorePartnershipApplicationRequestDto({
    required int level,
    required String name,
    required String nik,
    required String address,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? identityCardFile,
    String? note,
  }) = _StorePartnershipApplicationRequestDto;

  factory StorePartnershipApplicationRequestDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StorePartnershipApplicationRequestDtoFromJson(json);

  Map<String, dynamic> toFormMap() {
    final map = toJson();
    if (note == null || note!.trim().isEmpty) {
      map.remove('note');
    }
    return map;
  }
}
