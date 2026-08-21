import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/utils/json_converters.dart';
import 'package:app/features/contract/data/dtos/contract_document_dto.dart';
import 'package:app/features/contract/data/dtos/contract_note_dto.dart';
import 'package:app/features/contract/data/dtos/payment_schedule_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_dto.freezed.dart';
part 'contract_dto.g.dart';

Object? _readLatestNote(Map json, String key) {
  return json[key] ?? json['last_note'];
}

@freezed
abstract class ContractDto with _$ContractDto {
  const factory ContractDto({
    @IntStringConverter() required int id,
    String? contractNumber,
    @IntStringConverter() required int userId,
    String? userName,
    String? userIdentityNumber,
    String? address,
    @IntStringConverter() int? userIdentityNumberFileId,
    AppFileDto? userIdentityNumberFile,
    @IntStringConverter() int? cowId,
    @IntStringConverter() int? cowImageFileId,
    String? cowName,
    @DoubleStringConverter() double? cowPrice,
    @IntStringConverter() int? cowWeightKg,
    @IntStringConverter() int? cowQuantity,
    @DoubleStringConverter() double? cowTotalPrice,
    @IntStringConverter() int? bankAccountId,
    String? bankName,
    String? bankAccountName,
    String? bankAccountNumber,
    String? program,
    @IntStringConverter() int? contractMonthDuration,
    required String status,
    String? note,
    @DoubleStringConverter() double? profitSharingPercentage,
    @DoubleStringConverter() double? totalProfitPaid,
    @IntStringConverter() int? totalProfitPaidMonths,
    List<ContractNoteDto>? notes,
    @JsonKey(readValue: _readLatestNote) ContractNoteDto? latestNote,
    List<PaymentScheduleDto>? paymentSchedules,
    List<ContractDocumentDto>? contractDocuments,
    ContractDocumentDto? latestContractDocument,
    DateTime? startDate,
    DateTime? endDate,
    @IntStringConverter() required int isDocumentAccepted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContractDto;

  factory ContractDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDtoFromJson(json);
}
