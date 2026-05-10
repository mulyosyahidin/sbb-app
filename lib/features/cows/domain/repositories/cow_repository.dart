import 'package:app/core/errors/failure.dart';
import 'package:app/features/cows/data/dtos/responses/get_cow_by_id_response_dto.dart';
import 'package:app/features/cows/data/dtos/responses/get_cows_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class CowRepository {
  Future<Either<Failure, GetCowsResponseData>> getCows({int page = 1});
  Future<Either<Failure, GetCowByIdResponseData>> getCowById(int id);
}
