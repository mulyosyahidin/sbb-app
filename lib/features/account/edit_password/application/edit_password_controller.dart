import 'package:app/features/account/edit_password/domain/repositories/edit_password_repository.dart';
import 'package:app/features/account/edit_password/data/repositories/edit_password_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_password_controller.g.dart';

@riverpod
class EditPasswordController extends _$EditPasswordController {
  EditPasswordRepository get _repository => ref.watch(editPasswordRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    state = const AsyncLoading();

    final result = await _repository.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (message) {
        state = const AsyncData(null);
      },
    );
  }
}
