import 'dart:io';
import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/data_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/error_util.dart';
import 'package:app/features/account/edit_profile/data/datasources/edit_profile_remote_datasource.dart';
import 'package:app/features/account/edit_profile/data/dtos/requests/update_profile_request_dto.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/update_profile_response_dto.dart';
import 'package:app/features/account/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_repository_impl.g.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileRemoteDatasource _remoteDatasource;

  EditProfileRepositoryImpl(this._remoteDatasource);

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
  Future<Either<Failure, UpdateProfileResponseData>> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final response = await _remoteDatasource.updateProfile(
        UpdateProfileRequestDto(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
        ),
      );

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'EditProfileRepositoryImpl'));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileResponseData>> updateProfilePicture(
      File image) async {
    try {
      final response = await _remoteDatasource.updateProfilePicture(image);

      return Right(response.data!);
    } catch (e) {
      return Left(_mapExceptionToFailure(e, 'EditProfileRepositoryImpl'));
    }
  }
}

@riverpod
EditProfileRepository editProfileRepository(Ref ref) {
  return EditProfileRepositoryImpl(
    ref.watch(editProfileRemoteDatasourceProvider),
  );
}
