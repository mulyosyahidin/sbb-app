import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/home/data/dtos/responses/get_sliders_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slider_remote_data_source.g.dart';

abstract class SliderRemoteDataSource {
  Future<GetSlidersResponseDto> getSliders();
}

class SliderRemoteDataSourceImpl implements SliderRemoteDataSource {
  final Dio _dio;

  SliderRemoteDataSourceImpl(this._dio);

  @override
  Future<GetSlidersResponseDto> getSliders() async {
    const endpoint = ApiEndpoint.getSliders;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetSlidersResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = GetSlidersResponseDto.fromJson(e.response!.data);
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
SliderRemoteDataSource sliderRemoteDataSource(Ref ref) {
  return SliderRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
