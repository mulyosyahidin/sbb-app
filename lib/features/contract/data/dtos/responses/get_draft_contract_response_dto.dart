import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';

class GetDraftContractResponseData {
  final ContractDto? contract;

  GetDraftContractResponseData({
    this.contract,
  });

  factory GetDraftContractResponseData.fromJson(Map<String, dynamic> json) {
    return GetDraftContractResponseData(
      contract: json['contract'] != null
          ? ContractDto.fromJson(json['contract'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetDraftContractResponseDto extends ApiResponseDto<GetDraftContractResponseData> {
  GetDraftContractResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetDraftContractResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetDraftContractResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetDraftContractResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
