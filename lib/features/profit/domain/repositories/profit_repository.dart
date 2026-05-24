import 'package:app/core/errors/failure.dart';
import 'package:app/features/profit/data/dtos/responses/get_profit_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfitRepository {
  Future<Either<Failure, GetProfitResponseData>> getProfit();
}
