import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';

class GetContractResponseData {
  final ContractDto contract;

  GetContractResponseData({
    required this.contract,
  });

  factory GetContractResponseData.fromJson(Map<String, dynamic> json) {
    return GetContractResponseData(
      contract: ContractDto.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }
}

class GetContractResponseDto extends ApiResponseDto<GetContractResponseData> {
  GetContractResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetContractResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetContractResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetContractResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
