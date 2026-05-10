import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/contract/data/mappers/contract_mapper.dart';
import 'package:app/features/contract/data/repositories/contract_repository_impl.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/repositories/contract_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_list_controller.g.dart';

class ContractListState {
  final List<Contract> contracts;
  final PaginationDto? pagination;
  final bool isLoadingMore;

  ContractListState({
    required this.contracts,
    this.pagination,
    this.isLoadingMore = false,
  });

  ContractListState copyWith({
    List<Contract>? contracts,
    PaginationDto? pagination,
    bool? isLoadingMore,
  }) {
    return ContractListState(
      contracts: contracts ?? this.contracts,
      pagination: pagination ?? this.pagination,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class ContractListController extends _$ContractListController {
  ContractRepository get _repository => ref.watch(contractRepositoryProvider);

  @override
  FutureOr<ContractListState> build() async {
    return _fetchInitial();
  }

  Future<ContractListState> _fetchInitial() async {
    final result = await _repository.getContracts(page: 1);

    return result.fold(
      (l) => throw l,
      (r) => ContractListState(
        contracts: ContractMapper.toEntityList(r.contracts),
        pagination: r.pagination,
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

    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    final result = await _repository.getContracts(
      page: currentState.pagination!.currentPage + 1,
    );

    result.fold(
      (l) {
        state = AsyncData(currentState.copyWith(isLoadingMore: false));
      },
      (r) {
        state = AsyncData(
          currentState.copyWith(
            contracts: [
              ...currentState.contracts,
              ...ContractMapper.toEntityList(r.contracts),
            ],
            pagination: r.pagination,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchInitial());
  }
}
