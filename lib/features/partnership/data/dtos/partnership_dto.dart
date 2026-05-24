import 'package:freezed_annotation/freezed_annotation.dart';

import 'partnership_application_dto.dart';
import 'partnership_application_review_dto.dart';

part 'partnership_dto.freezed.dart';
part 'partnership_dto.g.dart';

int _intFromJson(Object? value) => int.tryParse(value?.toString() ?? '') ?? 0;
String _stringFromJson(Object? value) => value?.toString() ?? '';
String? _nullableStringFromJson(Object? value) => value?.toString();

@freezed
abstract class PartnershipDto with _$PartnershipDto {
  const factory PartnershipDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(fromJson: _intFromJson) required int userId,
    @JsonKey(fromJson: _intFromJson) required int level,
    @JsonKey(fromJson: _stringFromJson) required String levelLabel,
    @JsonKey(fromJson: _nullableStringFromJson) String? refferalCode,
    @JsonKey(fromJson: _nullableStringFromJson) String? approvedAt,
    PartnershipReviewerDto? approvedBy,
    PartnershipApplicationDto? latestApplication,
    @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
    @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt,
  }) = _PartnershipDto;

  factory PartnershipDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipDtoFromJson(json);
}
