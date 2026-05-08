import 'package:app/core/errors/failure.dart';
import 'package:app/features/gallery/data/dtos/responses/get_galleries_response_dto.dart';
import 'package:app/features/gallery/domain/entities/gallery.dart';
import 'package:fpdart/fpdart.dart';

abstract class GalleryRepository {
  Future<Either<Failure, GetGalleriesResponseData>> getGalleries({int page = 1});
  Future<Either<Failure, Gallery>> getGalleryById(int id);
}
