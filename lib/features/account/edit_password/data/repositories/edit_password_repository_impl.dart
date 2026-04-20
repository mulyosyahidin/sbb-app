import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/account/edit_password/data/datasources/edit_password_remote_data_source.dart';
import 'package:app/features/account/edit_password/data/dtos/requests/update_password_request_dto.dart';
import 'package:app/features/account/edit_password/domain/repositories/edit_password_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_password_repository_impl.g.dart';

class EditPasswordRepositoryImpl implements EditPasswordRepository {
  final EditPasswordRemoteDataSource _editPasswordRemoteDataSource;

  EditPasswordRepositoryImpl(this._editPasswordRemoteDataSource);

  Failure _mapExceptionToFailure(Object e, String reason) {
    final handled = ErrorUtil.handleRepositoryException(e, reason);
    if (handled is ApiException) {
      return ValidationFailure(handled.message, errors: handled.errors);
    }
    if (handled is DataException) {
      return ServerFailure(handled.message, code: handled.code);
    }
    return ServerFailure(handled.toString());
  }

  @override
  Future<Either<Failure, String>> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      final response = await _editPasswordRemoteDataSource.updatePassword(
        UpdatePasswordRequestDto(
          currentPassword: currentPassword,
          newPassword: newPassword,
          newPasswordConfirmation: newPasswordConfirmation,
        ),
      );

      return Right(response.message);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'EditPasswordRepositoryImpl'));
    }
  }
}

@riverpod
EditPasswordRepository editPasswordRepository(Ref ref) {
  return EditPasswordRepositoryImpl(
    ref.watch(editPasswordRemoteDataSourceProvider),
  );
}
