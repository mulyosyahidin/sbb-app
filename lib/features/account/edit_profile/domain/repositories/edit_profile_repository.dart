import 'dart:io';
import 'package:app/core/errors/failure.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/update_profile_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class EditProfileRepository {
  Future<Either<Failure, UpdateProfileResponseData>> updateProfile({
    required String name,
    required String email,
  });

  Future<Either<Failure, UpdateProfileResponseData>> updateProfilePicture(
      File image);
}
