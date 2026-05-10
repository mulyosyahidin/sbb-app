import 'package:app/core/errors/failure.dart';
import 'package:app/features/home/data/dtos/responses/get_sliders_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class SliderRepository {
  Future<Either<Failure, GetSlidersResponseData>> getSliders();
}
