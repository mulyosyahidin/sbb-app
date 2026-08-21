import 'package:app/core/errors/failure.dart';
import 'package:app/features/account/summary/data/dtos/user_summary_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserSummaryRepository {
  Future<Either<Failure, UserSummaryDto>> getUserSummary();
}
