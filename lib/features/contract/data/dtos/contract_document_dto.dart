import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_document_dto.freezed.dart';
part 'contract_document_dto.g.dart';

@freezed
abstract class ContractDocumentDto with _$ContractDocumentDto {
  const factory ContractDocumentDto({
    @IntStringConverter() required int id,
    @IntStringConverter() required int contractId,
    @IntStringConverter() required int fileId,
    AppFileDto? file,
    required String status,
    String? note,
    DateTime? verifiedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContractDocumentDto;

  factory ContractDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDocumentDtoFromJson(json);
}
