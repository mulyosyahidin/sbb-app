import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/edit_password/data/dtos/requests/update_password_request_dto.dart';
import 'package:app/features/account/edit_password/data/dtos/responses/update_password_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_password_remote_data_source.g.dart';

abstract class EditPasswordRemoteDataSource {
  Future<UpdatePasswordResponseDto> updatePassword(
      UpdatePasswordRequestDto dto);
}

class EditPasswordRemoteDataSourceImpl implements EditPasswordRemoteDataSource {
  final Dio _dio;

  EditPasswordRemoteDataSourceImpl(this._dio);

  @override
  Future<UpdatePasswordResponseDto> updatePassword(UpdatePasswordRequestDto dto) async {
    const endpoint = ApiEndpoint.updatePassword;

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

      final responseDto = UpdatePasswordResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = UpdatePasswordResponseDto.fromJson(e.response!.data);
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
EditPasswordRemoteDataSource editPasswordRemoteDataSource(Ref ref) {
  return EditPasswordRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
