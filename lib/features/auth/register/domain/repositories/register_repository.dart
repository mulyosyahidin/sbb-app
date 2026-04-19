import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/dto/responses/register_response_dto.dart';
import 'package:app/core/utils/result.dart';

abstract class RegisterRepository {
  Future<Result<RegisterResponseData>> register(RegisterRequestDto registerRequestDto);
}