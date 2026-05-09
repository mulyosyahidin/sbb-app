import 'dart:io';
import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/edit_profile/data/dtos/requests/update_profile_request_dto.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/update_profile_response_dto.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/resend_verification_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_remote_data_source.g.dart';

abstract class EditProfileRemoteDataSource {
  Future<UpdateProfileResponseDto> updateProfile(UpdateProfileRequestDto dto);

  Future<UpdateProfileResponseDto> updateProfilePicture(File image);

  Future<ResendVerificationResponseDto> resendVerificationEmail();
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
      LoggerUtil.api("PUT", endpoint, data: dto.toJson());

      final response = await _dio.put(endpoint, data: dto.toJson());
      responseDto = UpdateProfileResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = UpdateProfileResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal memperbarui profil');
  }

  @override
  Future<UpdateProfileResponseDto> updateProfilePicture(File image) async {
    const endpoint = ApiEndpoint.updateProfilePicture;
    UpdateProfileResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);

      final formData = FormData.fromMap({
        'picture': await MultipartFile.fromFile(image.path),
      });

      final response = await _dio.post(endpoint, data: formData);
      responseDto = UpdateProfileResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = UpdateProfileResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal memperbarui foto profil');
  }

  @override
  Future<ResendVerificationResponseDto> resendVerificationEmail() async {
    const endpoint = ApiEndpoint.resendVerificationEmail;
    ResendVerificationResponseDto? responseDto;

    try {
      LoggerUtil.api("POST", endpoint);

      final response = await _dio.post(endpoint);
      responseDto = ResendVerificationResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = ResendVerificationResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mengirim email verifikasi');
  }
}

@riverpod
EditProfileRemoteDataSource editProfileRemoteDataSource(Ref ref) {
  return EditProfileRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
