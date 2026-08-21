import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';

class SaveContractDraftResponseData {
  final ContractDto contract;

  SaveContractDraftResponseData({
    required this.contract,
  });

  factory SaveContractDraftResponseData.fromJson(Map<String, dynamic> json) {
    return SaveContractDraftResponseData(
      contract: ContractDto.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }
}

class SaveContractDraftResponseDto
    extends ApiResponseDto<SaveContractDraftResponseData> {
  SaveContractDraftResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory SaveContractDraftResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) =>
          SaveContractDraftResponseData.fromJson(data as Map<String, dynamic>),
    );

    return SaveContractDraftResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
