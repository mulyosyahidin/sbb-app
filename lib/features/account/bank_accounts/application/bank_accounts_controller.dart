import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/account/bank_accounts/data/mappers/bank_account_mapper.dart';
import 'package:app/features/account/bank_accounts/data/repositories/bank_account_repository_impl.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/features/account/bank_accounts/domain/repositories/bank_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_accounts_controller.g.dart';

class BankAccountsState {
  final List<BankAccount> accounts;
  final PaginationDto? pagination;
  final bool isLoadingMore;
  final int? processingId;
  final String? searchQuery;

  BankAccountsState({
    required this.accounts,
    this.pagination,
    this.isLoadingMore = false,
    this.processingId,
    this.searchQuery,
  });

  BankAccountsState copyWith({
    List<BankAccount>? accounts,
    PaginationDto? pagination,
    bool? isLoadingMore,
    int? processingId,
    String? searchQuery,
  }) {
    return BankAccountsState(
      accounts: accounts ?? this.accounts,
      pagination: pagination ?? this.pagination,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      processingId: processingId ?? this.processingId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

@riverpod
class BankAccountsController extends _$BankAccountsController {
  BankAccountRepository get _repository =>
      ref.watch(bankAccountRepositoryProvider);

  @override
  FutureOr<BankAccountsState> build() async {
    return _fetchInitial();
  }

  Future<BankAccountsState> _fetchInitial({String? search}) async {
    final result = await _repository.getBankAccounts(page: 1, search: search);

    return result.fold(
      (l) => throw l,
      (r) => BankAccountsState(
        accounts: BankAccountMapper.toEntityList(r.bankAccounts),
        pagination: r.pagination,
        searchQuery: search,
      ),
    );
  }

  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null || currentState.isLoadingMore) return;
    if (currentState.pagination == null) return;
    if (currentState.pagination!.currentPage >=
        currentState.pagination!.lastPage) {
      return;
    }

    state = AsyncData(
      currentState.copyWith(isLoadingMore: true),
    );

    final result = await _repository.getBankAccounts(
      page: currentState.pagination!.currentPage + 1,
      search: currentState.searchQuery,
    );

    result.fold(
      (l) {
        state = AsyncData(
          currentState.copyWith(isLoadingMore: false),
        );
      },
      (r) {
        state = AsyncData(
          currentState.copyWith(
            accounts: [
              ...currentState.accounts,
              ...BankAccountMapper.toEntityList(r.bankAccounts)
            ],
            pagination: r.pagination,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  Future<void> search(String query) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchInitial(search: query),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _fetchInitial(search: state.value?.searchQuery),
    );
  }

  Future<void> setPrimary(int id) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Set processing ID
    state = AsyncData(
      currentState.copyWith(processingId: id),
    );

    final result = await _repository.markAsPrimary(id);

    result.fold(
      (l) {
        // Clear processing ID on failure
        state = AsyncData(
          currentState.copyWith(processingId: null),
        );
      },
      (r) {
        // Clear processing ID and refresh the list
        state = AsyncData(
          currentState.copyWith(processingId: null),
        );
        refresh();
      },
    );
  }

  Future<void> deleteAccount(int id) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Set processing ID
    state = AsyncData(
      currentState.copyWith(processingId: id),
    );

    final result = await _repository.deleteBankAccount(id);

    result.fold(
      (l) {
        // Clear processing ID on failure
        state = AsyncData(
          currentState.copyWith(processingId: null),
        );
        throw l; // Rethrow to be caught by the UI
      },
      (r) {
        // Clear processing ID and refresh the list
        state = AsyncData(
          currentState.copyWith(processingId: null),
        );
        refresh();
      },
    );
  }
}
