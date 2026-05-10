import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';

class GetContractsResponseData {
  final List<ContractDto> contracts;
  final PaginationDto pagination;

  GetContractsResponseData({
    required this.contracts,
    required this.pagination,
  });

  factory GetContractsResponseData.fromJson(Map<String, dynamic> json) {
    return GetContractsResponseData(
      contracts: (json['contracts'] as List)
          .map((e) => ContractDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }
}

class GetContractsResponseDto extends ApiResponseDto<GetContractsResponseData> {
  GetContractsResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetContractsResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetContractsResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetContractsResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
