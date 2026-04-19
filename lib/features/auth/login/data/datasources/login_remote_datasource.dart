import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_remote_datasource.g.dart';

class LoginRemoteDatasource {
  final Dio _dio;

  LoginRemoteDatasource(this._dio);

  Future<LoginResponseDto> login(LoginRequestDto dto) async {
    const endpoint = ApiEndpoint.login;
    LoginResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint, data: dto.toJson());

      final response = await _dio.post(endpoint, data: dto.toJson());

      responseDto = LoginResponseDto.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'LoginRemoteDatasource.login (DioException)');

      if (e.response?.data != null) {
        responseDto = LoginResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e, stackTrace) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");

      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: 'LoginRemoteDatasource.login (Unexpected)');
      rethrow;
    }

    if (!responseDto.success) {
      throw responseDto.toException();
    }

    return responseDto;
  }
}

@riverpod
LoginRemoteDatasource loginRemoteDatasource(Ref ref) {
  return LoginRemoteDatasource(ref.watch(dioProvider));
}
