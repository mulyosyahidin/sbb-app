import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDatasource {
  Future<RefreshAccessTokenResponseDto> refreshToken(String accessToken);
  Future<GetMeResponseDto> getMe();
  Future<void> logout(String deviceId);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasourceImpl(this._dio);

  @override
  Future<RefreshAccessTokenResponseDto> refreshToken(String accessToken) async {
    const endpoint = ApiEndpoint.refreshToken;
    RefreshAccessTokenResponseDto? dto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      dto = RefreshAccessTokenResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        dto = RefreshAccessTokenResponseDto.fromJson(e.response!.data);
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

  @override
  Future<GetMeResponseDto> getMe() async {
    const endpoint = ApiEndpoint.getMe;
    GetMeResponseDto? dto;

    try {
      LoggerUtil.api("GET", endpoint);

      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      dto = GetMeResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        dto = GetMeResponseDto.fromJson(e.response!.data);
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

  @override
  Future<void> logout(String deviceId) async {
    const endpoint = ApiEndpoint.logout;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint, data: {
        'device_id': deviceId,
      });

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final dto = ApiResponseDto<void>.fromJson(
        response.data,
        (_) {},
      );

      if (!dto.success) {
        throw dto.toException();
      }
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      rethrow;
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }
}

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasourceImpl(
    ref.watch(dioProvider),
  );
}
