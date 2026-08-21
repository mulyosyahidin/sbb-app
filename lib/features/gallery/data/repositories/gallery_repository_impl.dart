import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:app/features/gallery/data/dtos/responses/get_galleries_response_dto.dart';
import 'package:app/features/gallery/data/dtos/responses/get_gallery_by_id_response_dto.dart';
import 'package:app/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_repository_impl.g.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource _remoteDataSource;

  GalleryRepositoryImpl(this._remoteDataSource);

  Failure _mapExceptionToFailure(Object e, String reason) {
    final handled = ErrorUtil.handleRepositoryException(e, reason);
    if (handled is ApiException) {
      return ValidationFailure(handled.message, errors: handled.errors);
    }
    if (handled is DataException) {
      return ServerFailure(handled.message, code: handled.code);
    }
    return ServerFailure(handled.toString());
  }

  @override
  Future<Either<Failure, GetGalleriesResponseData>> getGalleries({
    int page = 1,
  }) async {
    try {
      final response = await _remoteDataSource.getGalleries(page: page);
      return Right(response.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'GalleryRepositoryImpl.getGalleries'),
      );
    }
  }

  @override
  Future<Either<Failure, GetGalleryByIdResponseData>> getGalleryById(
    int id,
  ) async {
    try {
      final responseDto = await _remoteDataSource.getGalleryById(id);

      return Right(responseDto.data!);
    } catch (e) {
      return Left(
        _mapExceptionToFailure(e, 'GalleryRepositoryImpl.getGalleryById'),
      );
    }
  }
}

@riverpod
GalleryRepository galleryRepository(Ref ref) {
  return GalleryRepositoryImpl(
    ref.watch(galleryRemoteDataSourceProvider),
  );
}
