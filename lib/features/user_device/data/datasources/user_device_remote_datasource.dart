import 'dart:convert';

import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger.dart';
import 'package:app/features/user_device/data/requests/create_user_device_request.dart';
import 'package:app/features/user_device/data/responses/create_user_device_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_device_remote_datasource.g.dart';

class UserDeviceRemoteDatasource {
  final Dio _dio;

  UserDeviceRemoteDatasource(this._dio);

  Future<CreateUserDeviceResponseDto> createUserDevice(
      CreateUserDeviceRequest createUserDeviceRequest) async {
    const endpoint = ApiEndpoint.registerDevice;

    try {
      Logger.api('POST', endpoint);

      final response = await _dio.post(endpoint, data: createUserDeviceRequest);

      final data = response.data;
      final Map<String, dynamic> jsonData =
          data is String ? jsonDecode(data) : data;

      return CreateUserDeviceResponseDto.fromJson(jsonData);
    } on DioException catch (e, stackTrace) {
      Logger.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'UserDeviceRemoteDataSource.createUserDevice (DioException)',
      );

      if (e.response != null && e.response!.data != null) {
        final data = e.response!.data;
        final Map<String, dynamic> jsonData =
            data is String ? jsonDecode(data) : data as Map<String, dynamic>;
        return CreateUserDeviceResponseDto.fromJson(jsonData);
      }
      rethrow;
    } catch (e, stackTrace) {
      Logger.error("Unexpected error on endpoint $endpoint: $e");

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'UserDeviceRemoteDataSource.createUserDevice (Unexpected)',
      );
      rethrow;
    }
  }

  Future<void> unregisterDevice(String id) async {
    final endpoint = ApiEndpoint.unregisterDevice.replaceAll(':id', id);

    try {
      Logger.api('DELETE', endpoint);
      await _dio.delete(endpoint);
    } on DioException catch (e, stackTrace) {
      Logger.error("Api Error on endpoint $endpoint: ${e.message}");

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'UserDeviceRemoteDataSource.unregisterDevice (DioException)',
      );
      rethrow;
    } catch (e, stackTrace) {
      Logger.error("Unexpected error on endpoint $endpoint: $e");

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'UserDeviceRemoteDataSource.unregisterDevice (Unexpected)',
      );
      rethrow;
    }
  }
}

@riverpod
UserDeviceRemoteDatasource userDeviceRemoteDatasource(Ref ref) {
  return UserDeviceRemoteDatasource(ref.watch(dioProvider));
}
