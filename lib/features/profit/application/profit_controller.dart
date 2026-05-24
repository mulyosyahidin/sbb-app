import 'package:app/features/profit/data/mappers/profit_mapper.dart';
import 'package:app/features/profit/data/repositories/profit_repository_impl.dart';
import 'package:app/features/profit/domain/entities/profit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profitControllerProvider =
    FutureProvider.autoDispose<Profit>((ref) async {
  final repository = ref.watch(profitRepositoryProvider);
  final result = await repository.getProfit();

  return result.fold(
    (failure) => throw failure,
    ProfitMapper.toEntity,
  );
});
