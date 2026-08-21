import 'package:app/features/contract/data/dtos/requests/store_payment_proof_request_dto.dart';
import 'package:app/features/contract/data/mappers/contract_payment_proof_mapper.dart';
import 'package:app/features/contract/data/repositories/contract_repository_impl.dart';
import 'package:app/features/contract/domain/entities/contract_payment_proof.dart';
import 'package:app/features/contract/domain/repositories/contract_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_payment_controller.g.dart';

@riverpod
class ContractPaymentController extends _$ContractPaymentController {
  ContractRepository get _repository => ref.watch(contractRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<ContractPaymentProof?> uploadPaymentProof({
    required int contractId,
    required StorePaymentProofRequestDto request,
  }) async {
    ContractPaymentProof? paymentProof;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.storePaymentProof(
        contractId: contractId,
        request: request,
      );

      return result.fold(
        (failure) => throw failure,
        (data) {
          paymentProof = ContractPaymentProofMapper.toEntity(data.paymentProof);
        },
      );
    });

    return paymentProof;
  }
}
