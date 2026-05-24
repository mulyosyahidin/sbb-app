import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/summary/data/dtos/responses/get_user_summary_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserSummaryRemoteDataSource {
  Future<GetUserSummaryResponseDto> getUserSummary();
}

class UserSummaryRemoteDataSourceImpl implements UserSummaryRemoteDataSource {
  final Dio _dio;

  UserSummaryRemoteDataSourceImpl(this._dio);

  @override
  Future<GetUserSummaryResponseDto> getUserSummary() async {
    const endpoint = ApiEndpoint.getUserSummary;
    GetUserSummaryResponseDto? responseDto;

    try {
      LoggerUtil.api('GET', endpoint);
      final response = await _dio.get(endpoint);
      responseDto = GetUserSummaryResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error('Api Error on endpoint $endpoint: ${e.message}');
      if (e.response != null) {
        responseDto = GetUserSummaryResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan ringkasan user');
  }
}

final userSummaryRemoteDataSourceProvider =
    Provider<UserSummaryRemoteDataSource>((ref) {
  return UserSummaryRemoteDataSourceImpl(ref.watch(dioProvider));
});
