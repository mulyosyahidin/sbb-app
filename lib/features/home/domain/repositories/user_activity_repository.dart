import 'package:app/core/errors/failure.dart';
import 'package:app/features/home/data/dtos/responses/get_user_activities_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserActivityRepository {
  Future<Either<Failure, GetUserActivitiesResponseData>> getUserActivities();
}
