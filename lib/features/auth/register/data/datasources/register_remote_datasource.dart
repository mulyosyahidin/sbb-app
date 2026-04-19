import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_remote_datasource.g.dart';

abstract class RegisterRemoteDatasource {
  Future<RegisterResponseDto> register(RegisterRequestDto registerRequestDto);
}

class RegisterRemoteDatasourceImpl implements RegisterRemoteDatasource {
  final Dio _dio;

  RegisterRemoteDatasourceImpl(this._dio);

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

      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
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
RegisterRemoteDatasource registerRemoteDatasource(Ref ref) {
  return RegisterRemoteDatasourceImpl(ref.watch(dioProvider));
}
