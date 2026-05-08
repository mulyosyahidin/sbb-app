import 'package:app/core/errors/failure.dart';
import 'package:app/features/home/domain/entities/slider.dart';
import 'package:fpdart/fpdart.dart';

abstract class SliderRepository {
  Future<Either<Failure, List<Slider>>> getSliders();
}
