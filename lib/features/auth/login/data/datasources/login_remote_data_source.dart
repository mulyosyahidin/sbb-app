import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_remote_data_source.g.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto dto);
  Future<LoginResponseDto> loginWithGoogle(GoogleLoginRequestDto dto);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio _dio;

  LoginRemoteDataSourceImpl(this._dio);

  @override
  Future<LoginResponseDto> login(LoginRequestDto dto) async {
    const endpoint = ApiEndpoint.login;
    LoginResponseDto? responseDto;

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

      responseDto = LoginResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        responseDto = LoginResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }

    if (!responseDto.success) {
      throw responseDto.toException();
    }

    return responseDto;
  }

  @override
  Future<LoginResponseDto> loginWithGoogle(GoogleLoginRequestDto dto) async {
    const endpoint = ApiEndpoint.googleLogin;
    LoginResponseDto? responseDto;

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

      responseDto = LoginResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        responseDto = LoginResponseDto.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }

    if (!responseDto.success) {
      throw responseDto.toException();
    }

    return responseDto;
  }
}

@riverpod
LoginRemoteDataSource loginRemoteDataSource(Ref ref) {
  return LoginRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
