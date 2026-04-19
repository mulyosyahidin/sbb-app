import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/update_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/repositories/bank_account_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_account_edit_controller.g.dart';

@riverpod
class BankAccountEditController extends _$BankAccountEditController {
  @override
  FutureOr<void> build() {
    // Initial state: idle
  }

  Future<void> updateAccount({
    required String id,
    required String bankName,
    required String accountName,
    required String accountNumber,
    String? note,
    bool isPrimary = false,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(bankAccountRepositoryProvider);
    final dto = UpdateBankAccountRequestDto(
      bankName: bankName,
      accountName: accountName,
      accountNumber: accountNumber,
      note: note,
      isPrimary: isPrimary,
    );

    final result = await repository.updateBankAccount(id, dto);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (data) {
        state = const AsyncData(null);
        // Refresh the list to get updated data
        ref.read(bankAccountsControllerProvider.notifier).refresh();
      },
    );
  }
}
