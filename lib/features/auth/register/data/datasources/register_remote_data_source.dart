import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_remote_data_source.g.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponseDto> register(RegisterRequestDto registerRequestDto);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final Dio _dio;

  RegisterRemoteDataSourceImpl(this._dio);

  @override
  Future<RegisterResponseDto> register(
      RegisterRequestDto registerRequestDto) async {
    const endpoint = ApiEndpoint.register;
    RegisterResponseDto? dto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint, data: registerRequestDto);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      dto = RegisterResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        dto = RegisterResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }

    if (!dto.success) {
      throw dto.toException();
    }

    return dto;
  }
}

@riverpod
RegisterRemoteDataSource registerRemoteDataSource(Ref ref) {
  return RegisterRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
