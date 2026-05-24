import 'package:app/features/contract/data/mappers/contract_mapper.dart';
import 'package:app/features/contract/data/repositories/contract_repository_impl.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contractDetailControllerProvider =
    FutureProvider.autoDispose.family<Contract, String>((ref, id) async {
  final repository = ref.watch(contractRepositoryProvider);
  final result = await repository.getContractById(id);

  return result.fold(
    (failure) => throw failure,
    (data) => ContractMapper.toEntity(data.contract),
  );
});
