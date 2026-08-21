import 'dart:io';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/edit_profile/data/dtos/responses/update_profile_response_dto.dart';
import 'package:app/features/account/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:app/features/account/edit_profile/data/repositories/edit_profile_repository_impl.dart';
import 'package:app/features/home/application/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  EditProfileRepository get _repository =>
      ref.watch(editProfileRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateProfile({
    required String name,
    required String email,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.updateProfile(
        name: name,
        email: email,
      );

      return result.fold(
        (failure) => throw failure,
        (data) async {
          await _handleUpdateSuccess(data);
        },
      );
    });
  }

  Future<void> updateProfilePicture(File image) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.updateProfilePicture(image);

      return result.fold(
        (failure) => throw failure,
        (data) async {
          await _handleUpdateSuccess(data);
        },
      );
    });
  }

  Future<void> _handleUpdateSuccess(UpdateProfileResponseData data) async {
    final User user = UserMapper.toEntity(data.userDto);

    // Save to storage
    final tokenStorage = ref.read(tokenStorageProvider);
    await tokenStorage.saveUser(user);

    // Sync session state
    ref.read(authSessionControllerProvider.notifier).updateUser(user);

    // Invalidate other providers to ensure UI consistency (e.g. HomeHeader)
    ref.invalidate(fetchHomeDataProvider);

    LoggerUtil.info('Profile updated success: ${user.email}');
  }

  Future<bool> resendVerification() async {
    state = const AsyncLoading();
    bool success = false;

    state = await AsyncValue.guard(() async {
      final result = await _repository.resendVerificationEmail();

      return result.fold(
        (l) => throw l,
        (_) {
          success = true;
        },
      );
    });

    return success;
  }
}
