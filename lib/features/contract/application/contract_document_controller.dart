import 'package:app/features/contract/data/dtos/requests/upload_contract_document_request_dto.dart';
import 'package:app/features/contract/data/repositories/contract_repository_impl.dart';
import 'package:app/features/contract/domain/repositories/contract_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contract_document_controller.g.dart';

@riverpod
class ContractDocumentController extends _$ContractDocumentController {
  ContractRepository get _repository => ref.watch(contractRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<String?> sendContractDocument({
    required int contractId,
  }) async {
    String? message;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.sendContractDocument(
        contractId: contractId,
      );

      return result.fold(
        (failure) => throw failure,
        (data) {
          message = data;
        },
      );
    });

    return message;
  }

  Future<String?> uploadContractDocument({
    required int contractId,
    required UploadContractDocumentRequestDto request,
  }) async {
    String? message;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.uploadContractDocument(
        contractId: contractId,
        request: request,
      );

      return result.fold(
        (failure) => throw failure,
        (data) {
          message = data;
        },
      );
    });

    return message;
  }
}
