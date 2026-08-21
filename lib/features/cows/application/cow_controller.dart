import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/cows/data/mappers/cow_mapper.dart';
import 'package:app/features/cows/domain/entities/cow.dart';
import 'package:app/features/cows/domain/repositories/cow_repository.dart';
import 'package:app/features/cows/data/repositories/cow_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cow_controller.g.dart';

class CowState {
  final List<Cow> cows;
  final PaginationDto? pagination;
  final bool isLoadingMore;

  CowState({
    required this.cows,
    this.pagination,
    this.isLoadingMore = false,
  });

  CowState copyWith({
    List<Cow>? cows,
    PaginationDto? pagination,
    bool? isLoadingMore,
  }) {
    return CowState(
      cows: cows ?? this.cows,
      pagination: pagination ?? this.pagination,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class CowController extends _$CowController {
  CowRepository get _repository => ref.watch(cowRepositoryProvider);

  @override
  FutureOr<CowState> build() async {
    return _fetchInitial();
  }

  Future<CowState> _fetchInitial() async {
    final result = await _repository.getCows(page: 1);

    return result.fold(
      (l) => throw l,
      (r) => CowState(
        cows: CowMapper.toEntityList(r.cows),
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

    final result = await _repository.getCows(
      page: currentState.pagination!.currentPage + 1,
    );

    result.fold(
      (l) {
        state = AsyncData(currentState.copyWith(isLoadingMore: false));
      },
      (r) {
        state = AsyncData(
          currentState.copyWith(
            cows: [
              ...currentState.cows,
              ...CowMapper.toEntityList(r.cows),
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

@riverpod
Future<Cow> cowDetail(Ref ref, int id) async {
  final repository = ref.watch(cowRepositoryProvider);
  final result = await repository.getCowById(id);

  return result.fold(
    (l) => throw l,
    (r) => CowMapper.toEntity(r.cow),
  );
}
