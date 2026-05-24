import 'package:app/core/errors/failure.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/data/dtos/requests/store_payment_proof_request_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_contracts_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/get_draft_contract_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/save_contract_draft_response_dto.dart';
import 'package:app/features/contract/data/dtos/responses/store_payment_proof_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContractRepository {
  Future<Either<Failure, bool>> checkDraft();
  Future<Either<Failure, GetDraftContractResponseData>> getDraftContract();
  Future<Either<Failure, SaveContractDraftResponseData>> saveDraft(
    SaveDraftRequestDto request,
  );
  Future<Either<Failure, SaveContractDraftResponseData>> submitContract();
  Future<Either<Failure, GetContractResponseData>> getContractById(String id);
  Future<Either<Failure, StorePaymentProofResponseData>> storePaymentProof({
    required int contractId,
    required StorePaymentProofRequestDto request,
  });
  Future<Either<Failure, GetContractsResponseData>> getContracts({
    int page = 1,
    String? status,
  });
}
