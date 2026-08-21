import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/cows/data/dtos/responses/get_cow_by_id_response_dto.dart';
import 'package:app/features/cows/data/dtos/responses/get_cows_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cow_remote_data_source.g.dart';

abstract class CowRemoteDataSource {
  Future<GetCowsResponseDto> getCows({int page = 1});
  Future<GetCowByIdResponseDto> getCowById(int id);
}

class CowRemoteDataSourceImpl implements CowRemoteDataSource {
  final Dio _dio;

  CowRemoteDataSourceImpl(this._dio);

  @override
  Future<GetCowsResponseDto> getCows({int page = 1}) async {
    const endpoint = ApiEndpoint.getAllCows;

    try {
      LoggerUtil.api("GET", endpoint, queryParameters: {'page': page});

      final response =
          await _dio.get(endpoint, queryParameters: {'page': page});

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetCowsResponseDto.fromJson(response.data);

      if (!responseDto.success || responseDto.data == null) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetCowsResponseDto.fromJson(e.response!.data);
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
  Future<GetCowByIdResponseDto> getCowById(int id) async {
    final endpoint = ApiEndpoint.getCowById.replaceAll('{id}', id.toString());

    try {
      LoggerUtil.api("GET", endpoint);

      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetCowByIdResponseDto.fromJson(response.data);

      if (!responseDto.success || responseDto.data == null) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetCowByIdResponseDto.fromJson(e.response!.data);
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
CowRemoteDataSource cowRemoteDataSource(Ref ref) {
  return CowRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
