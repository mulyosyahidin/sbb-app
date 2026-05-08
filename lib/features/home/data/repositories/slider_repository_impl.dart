import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/features/home/data/datasources/slider_remote_data_source.dart';
import 'package:app/features/home/data/mappers/slider_mapper.dart';
import 'package:app/features/home/domain/entities/slider.dart';
import 'package:app/features/home/domain/repositories/slider_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slider_repository_impl.g.dart';

class SliderRepositoryImpl implements SliderRepository {
  final SliderRemoteDataSource _remoteDataSource;

  SliderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Slider>>> getSliders() async {
    try {
      final response = await _remoteDataSource.getSliders();
      final sliders = SliderMapper.toEntityList(response.data?.sliders ?? []);
      return Right(sliders);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

@riverpod
SliderRepository sliderRepository(Ref ref) {
  return SliderRepositoryImpl(
    ref.watch(sliderRemoteDataSourceProvider),
  );
}
