import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/data/mappers/contract_mapper.dart';
import 'package:app/features/contract/data/repositories/contract_repository_impl.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/features/contract/domain/repositories/contract_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_draft_controller.g.dart';

@riverpod
class ContractDraftController extends _$ContractDraftController {
  ContractRepository get _repository => ref.read(contractRepositoryProvider);

  @override
  Future<Contract?> build() async {
    final authState = ref.watch(authSessionControllerProvider);

    return authState.maybeWhen(
      data: (session) async {
        if (session.isAuthenticated) {
          return _fetchEditableContract();
        }
        return null;
      },
      orElse: () => null,
    );
  }

  Future<Contract?> checkDraft() async {
    state = const AsyncValue.loading();

    final contract = await _fetchEditableContract();

    state = AsyncValue.data(contract);

    return state.value;
  }

  Future<Contract?> _fetchEditableContract() async {
    final draftResult = await _repository.getDraftContract();
    final draftContract = draftResult.fold(
      (failure) => null,
      (data) => data.contract != null
          ? ContractMapper.toEntity(data.contract!)
          : null,
    );

    if (draftContract != null) {
      return draftContract;
    }

    final rejectedResult = await _repository.getContracts(
      status: ContractStatus.rejected.value,
    );

    return rejectedResult.fold(
      (failure) => null,
      (data) => data.contracts.isNotEmpty
          ? ContractMapper.toEntity(data.contracts.first)
          : null,
    );
  }

  Future<Contract?> saveDraft(
    SaveDraftRequestDto request,
  ) async {
    state = const AsyncValue.loading();

    final result = await _repository.saveDraft(request);

    return result.fold(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
        return null;
      },
      (r) {
        final contract = ContractMapper.toEntity(r.contract);
        state = AsyncValue.data(contract);
        return contract;
      },
    );
  }

  Future<Contract?> submitContract() async {
    final result = await _repository.submitContract();

    return result.fold(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
        return null;
      },
      (r) {
        final contract = ContractMapper.toEntity(r.contract);
        state = AsyncValue.data(contract);
        return contract;
      },
    );
  }
}
