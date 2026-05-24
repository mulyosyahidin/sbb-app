import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_payment_proof_dto.freezed.dart';
part 'contract_payment_proof_dto.g.dart';

@freezed
abstract class ContractPaymentProofDto with _$ContractPaymentProofDto {
  const factory ContractPaymentProofDto({
    @IntStringConverter() int? id,
    @IntStringConverter() int? contractId,
    @IntStringConverter() int? fileId,
    AppFileDto? file,
    required String bankName,
    required String bankAccountName,
    required String bankAccountNumber,
    @DoubleStringConverter() double? nominal,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContractPaymentProofDto;

  factory ContractPaymentProofDto.fromJson(Map<String, dynamic> json) =>
      _$ContractPaymentProofDtoFromJson(json);
}
