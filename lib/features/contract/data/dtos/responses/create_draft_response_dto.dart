import 'package:app/core/models/api_response_dto.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';

class CreateDraftResponseData {
  final ContractDto contract;

  CreateDraftResponseData({
    required this.contract,
  });

  factory CreateDraftResponseData.fromJson(Map<String, dynamic> json) {
    return CreateDraftResponseData(
      contract: ContractDto.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }
}

class CreateDraftResponseDto extends ApiResponseDto<CreateDraftResponseData> {
  CreateDraftResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory CreateDraftResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => CreateDraftResponseData.fromJson(data as Map<String, dynamic>),
    );

    return CreateDraftResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
