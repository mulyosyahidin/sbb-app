import 'package:app/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class EditPasswordRepository {
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  });
}
