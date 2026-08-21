import 'partnership_application_review_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partnership_application_dto.freezed.dart';
part 'partnership_application_dto.g.dart';

int _intFromJson(Object? value) => int.tryParse(value?.toString() ?? '') ?? 0;
int? _nullableIntFromJson(Object? value) =>
    value == null ? null : _intFromJson(value);
String _stringFromJson(Object? value) => value?.toString() ?? '';
String? _nullableStringFromJson(Object? value) => value?.toString();

@freezed
abstract class PartnershipIdentityCardFileDto
    with _$PartnershipIdentityCardFileDto {
  const factory PartnershipIdentityCardFileDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(fromJson: _stringFromJson) required String fileName,
    @JsonKey(fromJson: _stringFromJson) required String fileType,
    @JsonKey(fromJson: _stringFromJson) required String fileSize,
    @JsonKey(fromJson: _stringFromJson) required String fileUrl,
  }) = _PartnershipIdentityCardFileDto;

  factory PartnershipIdentityCardFileDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipIdentityCardFileDtoFromJson(json);
}

@freezed
abstract class PartnershipApplicationDto with _$PartnershipApplicationDto {
  const factory PartnershipApplicationDto({
    @JsonKey(fromJson: _intFromJson) required int id,
    @JsonKey(fromJson: _intFromJson) required int userId,
    @JsonKey(fromJson: _nullableIntFromJson) int? fromLevel,
    @JsonKey(fromJson: _nullableStringFromJson) String? fromLevelLabel,
    @JsonKey(fromJson: _intFromJson) required int toLevel,
    @JsonKey(fromJson: _stringFromJson) required String toLevelLabel,
    @JsonKey(fromJson: _stringFromJson) required String type,
    @JsonKey(fromJson: _stringFromJson) required String typeLabel,
    @JsonKey(fromJson: _stringFromJson) required String status,
    @JsonKey(fromJson: _stringFromJson) required String statusLabel,
    @JsonKey(fromJson: _stringFromJson) required String name,
    @JsonKey(fromJson: _stringFromJson) required String nik,
    @JsonKey(fromJson: _stringFromJson) required String address,
    PartnershipIdentityCardFileDto? identityCardFile,
    @JsonKey(fromJson: _nullableStringFromJson) String? note,
    @JsonKey(fromJson: _nullableStringFromJson) String? submittedAt,
    @JsonKey(fromJson: _nullableStringFromJson) String? lastSubmittedAt,
    @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
    PartnershipReviewerDto? reviewedBy,
    @Default([]) List<PartnershipApplicationReviewDto> reviews,
    @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
    @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt,
  }) = _PartnershipApplicationDto;

  factory PartnershipApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipApplicationDtoFromJson(json);
}
