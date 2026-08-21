import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/data/dtos/requests/store_payment_proof_request_dto.dart';
import 'package:app/features/contract/data/dtos/requests/upload_contract_document_request_dto.dart';
import 'package:app/features/contract/data/dtos/responses/check_draft_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/contract_document_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_draft_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contracts_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/save_contract_draft_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/store_payment_proof_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_remote_data_source.g.dart';

abstract class ContractRemoteDataSource {
  Future<CheckDraftResponseDto> checkDraft();
  Future<GetDraftContractResponseDto> getDraftContract();
  Future<SaveContractDraftResponseDto> saveDraft(SaveDraftRequestDto request);
  Future<SaveContractDraftResponseDto> submitContract();
  Future<GetContractResponseDto> getContractById(String id);
  Future<StorePaymentProofResponseDto> storePaymentProof({
    required int contractId,
    required StorePaymentProofRequestDto request,
  });
  Future<ContractDocumentResponseDto> sendContractDocument({
    required int contractId,
  });
  Future<ContractDocumentResponseDto> uploadContractDocument({
    required int contractId,
    required UploadContractDocumentRequestDto request,
  });
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
          if (status != null && status != 'Semua')
            'status': status.toLowerCase(),
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

  @override
  Future<GetContractResponseDto> getContractById(String id) async {
    final endpoint = ApiEndpoint.getContractById.replaceAll('{id}', id);
    GetContractResponseDto? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = GetContractResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = GetContractResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan detail kontrak');
  }

  @override
  Future<StorePaymentProofResponseDto> storePaymentProof({
    required int contractId,
    required StorePaymentProofRequestDto request,
  }) async {
    final endpoint = ApiEndpoint.storeContractPaymentProof.replaceAll(
      '{contract}',
      contractId.toString(),
    );
    StorePaymentProofResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint, data: request.toJson());

      final map = request.toJson();
      map['file'] = await MultipartFile.fromFile(request.file.path);

      final response = await _dio.post(
        endpoint,
        data: FormData.fromMap(map),
      );
      responseDto = StorePaymentProofResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = StorePaymentProofResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mengunggah bukti pembayaran');
  }

  @override
  Future<ContractDocumentResponseDto> sendContractDocument({
    required int contractId,
  }) async {
    final endpoint = ApiEndpoint.sendContractDocument.replaceAll(
      '{contract}',
      contractId.toString(),
    );
    ContractDocumentResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);
      final response = await _dio.post(endpoint);
      responseDto = ContractDocumentResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = ContractDocumentResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mengirim dokumen kontrak');
  }

  @override
  Future<ContractDocumentResponseDto> uploadContractDocument({
    required int contractId,
    required UploadContractDocumentRequestDto request,
  }) async {
    final endpoint = ApiEndpoint.uploadContractDocument.replaceAll(
      '{contract}',
      contractId.toString(),
    );
    ContractDocumentResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(
        endpoint,
        data: FormData.fromMap({
          'file': await MultipartFile.fromFile(request.file.path),
        }),
      );
      responseDto = ContractDocumentResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = ContractDocumentResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mengunggah dokumen kontrak');
  }
}

@riverpod
ContractRemoteDataSource contractRemoteDataSource(Ref ref) {
  return ContractRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
