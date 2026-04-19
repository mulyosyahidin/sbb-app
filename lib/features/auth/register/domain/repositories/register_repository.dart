import 'package:app/core/errors/failure.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseData>> register(
      RegisterRequestDto registerRequestDto);
}