import 'package:app/features/account/summary/data/mappers/user_summary_mapper.dart';
import 'package:app/features/account/summary/data/repositories/user_summary_repository_impl.dart';
import 'package:app/features/account/summary/domain/entities/user_summary.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSummaryControllerProvider =
    FutureProvider.autoDispose<UserSummary>((ref) async {
  final repository = ref.watch(userSummaryRepositoryProvider);
  final result = await repository.getUserSummary();

  return result.fold(
    (failure) => throw failure,
    UserSummaryMapper.toEntity,
  );
});
