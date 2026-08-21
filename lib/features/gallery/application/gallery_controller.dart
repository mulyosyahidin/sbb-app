import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/gallery/data/mappers/gallery_mapper.dart';
import 'package:app/features/gallery/domain/entities/gallery.dart';
import 'package:app/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:app/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_controller.g.dart';

class GalleryState {
  final List<Gallery> galleries;
  final PaginationDto? pagination;
  final bool isLoadingMore;

  GalleryState({
    required this.galleries,
    this.pagination,
    this.isLoadingMore = false,
  });

  GalleryState copyWith({
    List<Gallery>? galleries,
    PaginationDto? pagination,
    bool? isLoadingMore,
  }) {
    return GalleryState(
      galleries: galleries ?? this.galleries,
      pagination: pagination ?? this.pagination,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class GalleryController extends _$GalleryController {
  GalleryRepository get _repository => ref.watch(galleryRepositoryProvider);

  @override
  FutureOr<GalleryState> build() async {
    return _fetchInitial();
  }

  Future<GalleryState> _fetchInitial() async {
    final result = await _repository.getGalleries(page: 1);

    return result.fold(
      (l) => throw l,
      (r) => GalleryState(
        galleries: GalleryMapper.toEntityList(r.galleries),
        pagination: r.pagination,
      ),
    );
  }

  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null || currentState.isLoadingMore) return;
    if (currentState.pagination == null) return;
    if (currentState.pagination!.currentPage >= currentState.pagination!.lastPage) {
      return;
    }

    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    final result = await _repository.getGalleries(
      page: currentState.pagination!.currentPage + 1,
    );

    result.fold(
      (l) {
        state = AsyncData(currentState.copyWith(isLoadingMore: false));
      },
      (r) {
        state = AsyncData(
          currentState.copyWith(
            galleries: [
              ...currentState.galleries,
              ...GalleryMapper.toEntityList(r.galleries),
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
Future<Gallery> galleryDetail(Ref ref, int id) async {
  final repository = ref.watch(galleryRepositoryProvider);
  final result = await repository.getGalleryById(id);

  return result.fold(
    (l) => throw l,
    (r) => GalleryMapper.toEntity(r.gallery),
  );
}
