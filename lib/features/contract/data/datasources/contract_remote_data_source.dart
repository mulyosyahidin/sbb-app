import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/data/dtos/responses/check_draft_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_draft_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contracts_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/save_contract_draft_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_remote_data_source.g.dart';

abstract class ContractRemoteDataSource {
  Future<CheckDraftResponseDto> checkDraft();
  Future<GetDraftContractResponseDto> getDraftContract();
  Future<SaveContractDraftResponseDto> saveDraft(SaveDraftRequestDto request);
  Future<SaveContractDraftResponseDto> submitContract();
  Future<GetContractsResponseDto> getContracts({int page = 1, String? status});
}

class ContractRemoteDataSourceImpl implements ContractRemoteDataSource {
  final Dio _dio;

  ContractRemoteDataSourceImpl(this._dio);

  @override
  Future<CheckDraftResponseDto> checkDraft() async {
    const endpoint = ApiEndpoint.checkContractDraft;
    CheckDraftResponseDto? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = CheckDraftResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = CheckDraftResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal melakukan pengecekan draft kontrak');
  }

  @override
  Future<GetDraftContractResponseDto> getDraftContract() async {
    const endpoint = ApiEndpoint.getContractDraft;
    GetDraftContractResponseDto? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = GetDraftContractResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = GetDraftContractResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan draft kontrak');
  }

  @override
  Future<SaveContractDraftResponseDto> saveDraft(
    SaveDraftRequestDto request,
  ) async {
    const endpoint = ApiEndpoint.saveContractDraft;
    SaveContractDraftResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);

      final map = request.toJson();
      if (request.userIdentityNumberFile != null) {
        map['user_identity_number_file'] = await MultipartFile.fromFile(
          request.userIdentityNumberFile!.path,
        );
      }

      final response = await _dio.post(
        endpoint,
        data: FormData.fromMap(map),
      );
      responseDto = SaveContractDraftResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = SaveContractDraftResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal menyimpan draft kontrak');
  }

  @override
  Future<SaveContractDraftResponseDto> submitContract() async {
    const endpoint = ApiEndpoint.submitContract;
    SaveContractDraftResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);
      final response = await _dio.post(endpoint);
      responseDto = SaveContractDraftResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = SaveContractDraftResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mengajukan kontrak');
  }

  @override
  Future<GetContractsResponseDto> getContracts({
    int page = 1,
    String? status,
  }) async {
    final endpoint = ApiEndpoint.getContracts;
    GetContractsResponseDto? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(
        endpoint,
        queryParameters: {
          'page': page,
          if (status != null && status != 'Semua') 'status': status.toLowerCase(),
        },
      );
      responseDto = GetContractsResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = GetContractsResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan daftar kontrak');
  }
}

@riverpod
ContractRemoteDataSource contractRemoteDataSource(Ref ref) {
  return ContractRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
