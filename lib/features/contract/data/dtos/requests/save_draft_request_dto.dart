import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_draft_request_dto.freezed.dart';
part 'save_draft_request_dto.g.dart';

@freezed
abstract class SaveDraftRequestDto with _$SaveDraftRequestDto {
  const factory SaveDraftRequestDto({
    String? userName,
    String? userIdentityNumber,
    String? address,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? userIdentityNumberFile,
    int? cowId,
    int? cowQuantity,
    double? cowTotalPrice,
    int? bankAccountId,
    String? program,
    int? contractMonthDuration,
    bool? deleteUserIdentityNumberFile,
  }) = _SaveDraftRequestDto;

  factory SaveDraftRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SaveDraftRequestDtoFromJson(json);
}
