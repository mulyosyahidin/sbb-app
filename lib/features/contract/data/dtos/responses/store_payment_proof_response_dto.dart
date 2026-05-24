import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/contract/data/dtos/contract_payment_proof_dto.dart';

class StorePaymentProofResponseData {
  final ContractPaymentProofDto paymentProof;

  StorePaymentProofResponseData({
    required this.paymentProof,
  });

  factory StorePaymentProofResponseData.fromJson(Map<String, dynamic> json) {
    return StorePaymentProofResponseData(
      paymentProof: ContractPaymentProofDto.fromJson(
        json['payment_proof'] as Map<String, dynamic>,
      ),
    );
  }
}

class StorePaymentProofResponseDto
    extends ApiResponseDto<StorePaymentProofResponseData> {
  StorePaymentProofResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory StorePaymentProofResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) =>
          StorePaymentProofResponseData.fromJson(data as Map<String, dynamic>),
    );

    return StorePaymentProofResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
