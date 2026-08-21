import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/features/home/data/datasources/user_activity_remote_data_source.dart';
import 'package:app/features/home/data/dtos/responses/get_user_activities_response_dto.dart';
import 'package:app/features/home/domain/repositories/user_activity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_activity_repository_impl.g.dart';

class UserActivityRepositoryImpl implements UserActivityRepository {
  final UserActivityRemoteDataSource _remoteDataSource;

  UserActivityRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, GetUserActivitiesResponseData>>
      getUserActivities() async {
    try {
      final response = await _remoteDataSource.getUserActivities();

      return Right(response.data!);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

@riverpod
UserActivityRepository userActivityRepository(Ref ref) {
  return UserActivityRepositoryImpl(
    ref.watch(userActivityRemoteDataSourceProvider),
  );
}
