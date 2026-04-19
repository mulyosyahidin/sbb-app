import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/create_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/repositories/bank_account_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_account_create_controller.g.dart';

@riverpod
class BankAccountCreateController extends _$BankAccountCreateController {
  @override
  FutureOr<void> build() {
    // Initial state: idle
  }

  Future<void> create({
    required String bankName,
    required String accountName,
    required String accountNumber,
    String? note,
    bool isPrimary = false,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(bankAccountRepositoryProvider);
    final dto = CreateBankAccountRequestDto(
      bankName: bankName,
      accountName: accountName,
      accountNumber: accountNumber,
      note: note,
      isPrimary: isPrimary,
    );

    final result = await repository.createBankAccount(dto);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (data) {
        state = const AsyncData(null);

        // Refresh the list to show skeletons and get new data
        ref.read(bankAccountsControllerProvider.notifier).refresh();
      },
    );
  }
}
