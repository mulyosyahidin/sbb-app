import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/gallery/data/dtos/gallery_dto.dart';
import 'package:app/features/gallery/data/dtos/responses/get_galleries_response_dto.dart';
import 'package:app/features/gallery/data/dtos/responses/get_gallery_by_id_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_remote_data_source.g.dart';

abstract class GalleryRemoteDataSource {
  Future<GetGalleriesResponseData> getGalleries({int page = 1});
  Future<GalleryDto> getGalleryById(int id);
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final Dio _dio;

  GalleryRemoteDataSourceImpl(this._dio);

  @override
  Future<GetGalleriesResponseData> getGalleries({int page = 1}) async {
    const endpoint = ApiEndpoint.getAllGalleries;

    try {
      LoggerUtil.api("GET", endpoint, queryParameters: {'page': page});

      final response = await _dio.get(endpoint, queryParameters: {'page': page});

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetGalleriesResponseDto.fromJson(response.data);

      if (!responseDto.success || responseDto.data == null) {
        throw responseDto.toException();
      }

      return responseDto.data!;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        final dto = GetGalleriesResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<GalleryDto> getGalleryById(int id) async {
    final endpoint = ApiEndpoint.getGalleryById.replaceAll('{id}', id.toString());

    try {
      LoggerUtil.api("GET", endpoint);

      final response = await _dio.get(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = GetGalleryByIdResponse.fromJson(response.data);

      if (!responseDto.success || responseDto.data == null) {
        throw responseDto.toException();
      }

      return responseDto.data!;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        final dto = GetGalleryByIdResponse.fromJson(e.response!.data);
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
GalleryRemoteDataSource galleryRemoteDataSource(Ref ref) {
  return GalleryRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
