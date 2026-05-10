import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_dto.freezed.dart';
part 'contract_dto.g.dart';

@freezed
abstract class ContractDto with _$ContractDto {
  const factory ContractDto({
    @IntStringConverter() required int id,
    String? contractNumber,
    @IntStringConverter() required int userId,
    String? userName,
    String? userIdentityNumber,
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
    DateTime? startDate,
    DateTime? endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContractDto;

  factory ContractDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDtoFromJson(json);
}
