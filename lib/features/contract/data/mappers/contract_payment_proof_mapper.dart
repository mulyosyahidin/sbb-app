import 'package:app/core/mappers/app_file_mapper.dart';
import 'package:app/features/contract/data/dtos/contract_payment_proof_dto.dart';
import 'package:app/features/contract/domain/entities/contract_payment_proof.dart';

class ContractPaymentProofMapper {
  static ContractPaymentProof toEntity(ContractPaymentProofDto dto) {
    return ContractPaymentProof(
      id: dto.id ?? 0,
      contractId: dto.contractId ?? 0,
      fileId: dto.fileId ?? 0,
      file: dto.file != null ? AppFileMapper.toEntity(dto.file!) : null,
      bankName: dto.bankName,
      bankAccountName: dto.bankAccountName,
      bankAccountNumber: dto.bankAccountNumber,
      nominal: dto.nominal ?? 0,
      status: dto.status,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
