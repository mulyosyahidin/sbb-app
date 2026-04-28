import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/partner/data/dtos/requests/register_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/requests/update_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/responses/check_partner_response_dto.dart';
import 'package:app/features/partner/data/dtos/responses/get_partner_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_remote_data_source.g.dart';

abstract class PartnerRemoteDataSource {
  Future<CheckPartnerResponseDto> checkPartner();
  Future<GetPartnerResponseDto> getPartner();
  Future<GetPartnerResponseDto> registerPartner(RegisterPartnerRequestDto dto);
  Future<GetPartnerResponseDto> updatePartner(UpdatePartnerRequestDto dto);
}

class PartnerRemoteDataSourceImpl implements PartnerRemoteDataSource {
  final Dio _dio;

  PartnerRemoteDataSourceImpl(this._dio);

  @override
  Future<CheckPartnerResponseDto> checkPartner() async {
    const endpoint = ApiEndpoint.checkPartner;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = CheckPartnerResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = CheckPartnerResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<GetPartnerResponseDto> getPartner() async {
    const endpoint = ApiEndpoint.getPartner;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetPartnerResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetPartnerResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<GetPartnerResponseDto> registerPartner(
      RegisterPartnerRequestDto dto) async {
    const endpoint = ApiEndpoint.registerPartner;

    try {
      LoggerUtil.api(
        "POST",
        endpoint,
        data: dto.toJson(),
      );
      final response = await _dio.post(
        endpoint,
        data: dto.toJson(),
      );

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetPartnerResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetPartnerResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<GetPartnerResponseDto> updatePartner(
      UpdatePartnerRequestDto dto) async {
    const endpoint = ApiEndpoint.updatePartner;

    try {
      LoggerUtil.api(
        "PUT",
        endpoint,
        data: dto.toJson(),
      );
      final response = await _dio.put(
        endpoint,
        data: dto.toJson(),
      );

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetPartnerResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetPartnerResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }
}

@riverpod
PartnerRemoteDataSource partnerRemoteDataSource(Ref ref) {
  return PartnerRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
