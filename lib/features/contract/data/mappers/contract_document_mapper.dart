import 'package:app/core/mappers/app_file_mapper.dart';
import 'package:app/features/contract/data/dtos/contract_document_dto.dart';
import 'package:app/features/contract/domain/entities/contract_document.dart';

class ContractDocumentMapper {
  static ContractDocument toEntity(ContractDocumentDto dto) {
    return ContractDocument(
      id: dto.id,
      contractId: dto.contractId,
      fileId: dto.fileId,
      file: dto.file != null ? AppFileMapper.toEntity(dto.file!) : null,
      status: dto.status,
      note: dto.note,
      verifiedAt: dto.verifiedAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static List<ContractDocument> toEntityList(List<ContractDocumentDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
