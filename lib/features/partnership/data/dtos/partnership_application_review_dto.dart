import 'package:freezed_annotation/freezed_annotation.dart';

part 'partnership_application_review_dto.freezed.dart';
part 'partnership_application_review_dto.g.dart';

int _intFromJson(Object? value) => int.tryParse(value?.toString() ?? '') ?? 0;
String _stringFromJson(Object? value) => value?.toString() ?? '';
String? _nullableStringFromJson(Object? value) => value?.toString();

@freezed
abstract class PartnershipReviewerDto with _$PartnershipReviewerDto {
  const factory PartnershipReviewerDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(fromJson: _stringFromJson) required String name,
  }) = _PartnershipReviewerDto;

  factory PartnershipReviewerDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipReviewerDtoFromJson(json);
}

@freezed
abstract class PartnershipApplicationReviewDto
    with _$PartnershipApplicationReviewDto {
  const factory PartnershipApplicationReviewDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(fromJson: _stringFromJson) required String status,
    @JsonKey(fromJson: _stringFromJson) required String statusLabel,
    @JsonKey(fromJson: _nullableStringFromJson) String? note,
    @JsonKey(fromJson: _nullableStringFromJson) String? dataSnapshot,
    @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
    PartnershipReviewerDto? reviewedBy,
    @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
    @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt,
  }) = _PartnershipApplicationReviewDto;

  factory PartnershipApplicationReviewDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PartnershipApplicationReviewDtoFromJson(json);
}
