import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/domain/entities/register_user.dart';
import 'package:app/core/utils/result.dart';

abstract class RegisterRepository {
  Future<Result<RegisterUser>> register(RegisterRequestDto registerRequestDto);
}