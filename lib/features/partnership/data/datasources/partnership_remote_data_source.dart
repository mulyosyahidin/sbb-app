import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/partnership/data/dtos/requests/store_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/requests/update_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/responses/check_partnership_response.dart';
import 'package:app/features/partnership/data/dtos/responses/get_partnership_applications_response.dart';
import 'package:app/features/partnership/data/dtos/responses/partnership_application_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partnership_remote_data_source.g.dart';

abstract class PartnershipRemoteDataSource {
  Future<CheckPartnershipResponse> checkPartnership();
  Future<GetPartnershipApplicationsResponse> getApplications({
    int perPage = 10,
  });
  Future<PartnershipApplicationResponse> storeApplication(
    StorePartnershipApplicationRequestDto request,
  );
  Future<PartnershipApplicationResponse> getApplicationById(int id);
  Future<PartnershipApplicationResponse> updateApplication({
    required int id,
    required UpdatePartnershipApplicationRequestDto request,
  });
}

class PartnershipRemoteDataSourceImpl implements PartnershipRemoteDataSource {
  final Dio _dio;

  PartnershipRemoteDataSourceImpl(this._dio);

  @override
  Future<CheckPartnershipResponse> checkPartnership() async {
    const endpoint = ApiEndpoint.checkPartner;
    CheckPartnershipResponse? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = CheckPartnershipResponse.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = CheckPartnershipResponse.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      }
      throw responseDto.toException();
    }

    throw Exception('Gagal melakukan pemeriksaan data kemitraan');
  }

  @override
  Future<GetPartnershipApplicationsResponse> getApplications({
    int perPage = 10,
  }) async {
    const endpoint = ApiEndpoint.getPartnershipApplications;
    GetPartnershipApplicationsResponse? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(
        endpoint,
        queryParameters: {'per_page': perPage},
      );
      responseDto = GetPartnershipApplicationsResponse.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto =
            GetPartnershipApplicationsResponse.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      }
      throw responseDto.toException();
    }

    throw Exception('Gagal mengambil riwayat pengajuan kemitraan');
  }

  @override
  Future<PartnershipApplicationResponse> storeApplication(
    StorePartnershipApplicationRequestDto request,
  ) async {
    const endpoint = ApiEndpoint.storePartnershipApplication;
    PartnershipApplicationResponse? responseDto;

    try {
      LoggerUtil.api("POST", endpoint, data: request.toFormMap());
      final map = request.toFormMap();
      map['identity_card_file'] = await MultipartFile.fromFile(
        request.identityCardFile!.path,
      );

      final response = await _dio.post(
        endpoint,
        data: FormData.fromMap(map),
      );
      responseDto = PartnershipApplicationResponse.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = PartnershipApplicationResponse.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      }
      throw responseDto.toException();
    }

    throw Exception('Gagal mengirim pengajuan kemitraan');
  }

  @override
  Future<PartnershipApplicationResponse> getApplicationById(int id) async {
    final endpoint = ApiEndpoint.getPartnershipApplicationById.replaceAll(
      '{application}',
      id.toString(),
    );
    PartnershipApplicationResponse? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = PartnershipApplicationResponse.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = PartnershipApplicationResponse.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      }
      throw responseDto.toException();
    }

    throw Exception('Gagal mengambil detail pengajuan kemitraan');
  }

  @override
  Future<PartnershipApplicationResponse> updateApplication({
    required int id,
    required UpdatePartnershipApplicationRequestDto request,
  }) async {
    final endpoint = ApiEndpoint.updatePartnershipApplication.replaceAll(
      '{application}',
      id.toString(),
    );
    PartnershipApplicationResponse? responseDto;

    try {
      LoggerUtil.api("POST", endpoint, data: request.toFormMap());
      final map = request.toFormMap();
      if (request.identityCardFile != null) {
        map['identity_card_file'] = await MultipartFile.fromFile(
          request.identityCardFile!.path,
        );
      }

      final response = await _dio.post(
        endpoint,
        data: FormData.fromMap(map),
      );
      responseDto = PartnershipApplicationResponse.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = PartnershipApplicationResponse.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      }
      throw responseDto.toException();
    }

    throw Exception('Gagal memperbarui pengajuan kemitraan');
  }
}

@riverpod
PartnershipRemoteDataSource partnershipRemoteDataSource(Ref ref) {
  return PartnershipRemoteDataSourceImpl(ref.watch(dioProvider));
}
