import 'dart:io';
import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/edit_profile/data/dtos/requests/update_profile_request_dto.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/update_profile_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_remote_data_source.g.dart';

abstract class EditProfileRemoteDataSource {
  Future<UpdateProfileResponseDto> updateProfile(UpdateProfileRequestDto dto);

  Future<UpdateProfileResponseDto> updateProfilePicture(File image);
}

class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final Dio _dio;

  EditProfileRemoteDataSourceImpl(this._dio);

  @override
  Future<UpdateProfileResponseDto> updateProfile(
      UpdateProfileRequestDto dto) async {
    const endpoint = ApiEndpoint.updateProfile;
    UpdateProfileResponseDto? responseDto;

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

      responseDto = UpdateProfileResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        responseDto = UpdateProfileResponseDto.fromJson(e.response!.data);
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
  Future<UpdateProfileResponseDto> updateProfilePicture(File image) async {
    const endpoint = ApiEndpoint.updateProfilePicture;
    UpdateProfileResponseDto? dto;

    try {
      LoggerUtil.api("PUT", endpoint);

      final formData = FormData.fromMap({
        'picture': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
        '_method': 'PUT'
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
      );

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      dto = UpdateProfileResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        dto = UpdateProfileResponseDto.fromJson(e.response!.data);
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
EditProfileRemoteDataSource editProfileRemoteDataSource(Ref ref) {
  return EditProfileRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
