import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/profit/data/dtos/responses/get_profit_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfitRemoteDataSource {
  Future<GetProfitResponseDto> getProfit();
}

class ProfitRemoteDataSourceImpl implements ProfitRemoteDataSource {
  final Dio _dio;

  ProfitRemoteDataSourceImpl(this._dio);

  @override
  Future<GetProfitResponseDto> getProfit() async {
    const endpoint = ApiEndpoint.getProfit;
    GetProfitResponseDto? responseDto;

    try {
      LoggerUtil.api('GET', endpoint);
      final response = await _dio.get(endpoint);
      responseDto = GetProfitResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error('Api Error on endpoint $endpoint: ${e.message}');
      if (e.response != null) {
        responseDto = GetProfitResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan data profit');
  }
}

final profitRemoteDataSourceProvider = Provider<ProfitRemoteDataSource>((ref) {
  return ProfitRemoteDataSourceImpl(ref.watch(dioProvider));
});
