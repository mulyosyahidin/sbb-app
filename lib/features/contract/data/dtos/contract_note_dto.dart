import 'package:app/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_note_dto.freezed.dart';
part 'contract_note_dto.g.dart';

@freezed
abstract class ContractNoteDto with _$ContractNoteDto {
  const factory ContractNoteDto({
    @IntStringConverter() required int id,
    @IntStringConverter() required int userId,
    @IntStringConverter() required int contractId,
    required String note,
    Map<String, dynamic>? dataAfter,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContractNoteDto;

  factory ContractNoteDto.fromJson(Map<String, dynamic> json) =>
      _$ContractNoteDtoFromJson(json);
}
