import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_remote_datasource.g.dart';

class RegisterRemoteDatasource {
  final Dio _dio;

  RegisterRemoteDatasource(this._dio);

  Future<RegisterResponseDto> register(
      RegisterRequestDto registerRequestDto) async {
    const endpoint = ApiEndpoint.register;
    RegisterResponseDto? dto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint, data: registerRequestDto);

      dto = RegisterResponseDto.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'RegisterRemoteDataSource.register (DioException)');

      if (e.response?.data != null) {
        dto = RegisterResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e, stackTrace) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'RegisterRemoteDataSource.register (Unexpected)');
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
  return RegisterRemoteDatasource(ref.watch(dioProvider));
}
