import 'package:app/core/auth/data/dtos/responses/get_me_response_dto.dart';
import 'package:app/core/auth/data/dtos/responses/refresh_access_token_response_dto.dart';
import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_datasource.g.dart';

class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<RefreshAccessTokenResponseDto> refreshToken(String accessToken) async {
    const endpoint = ApiEndpoint.refreshToken;
    RefreshAccessTokenResponseDto? dto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint);

      dto = RefreshAccessTokenResponseDto.fromJson(response.data);
    }on DioException catch (e, stackTrace) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'AuthRemoteDatasource.refreshToken (DioException)');

      if (e.response?.data != null) {
        dto = RefreshAccessTokenResponseDto.fromJson(e.response!.data);
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

  Future<GetMeResponseDto> getMe() async {
    const endpoint = ApiEndpoint.getMe;
    GetMeResponseDto? dto;

    try {
      LoggerUtil.api("GET", endpoint);

      final response = await _dio.get(endpoint);

      dto = GetMeResponseDto.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'AuthRemoteDatasource.getMe (DioException)');

      if (e.response?.data != null) {
        dto = GetMeResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e, stackTrace) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'AuthRemoteDatasource.getMe (Unexpected)');
      rethrow;
    }

    if (!dto.success) {
      throw dto.toException();
    }

    return dto;
  }
}

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasource(ref.watch(dioProvider));
}
