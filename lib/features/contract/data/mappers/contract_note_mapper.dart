import 'package:app/features/contract/data/dtos/contract_note_dto.dart';
import 'package:app/features/contract/domain/entities/contract_note.dart';

class ContractNoteMapper {
  static ContractNote toEntity(ContractNoteDto dto) {
    return ContractNote(
      id: dto.id,
      userId: dto.userId,
      contractId: dto.contractId,
      note: dto.note,
      dataAfter: dto.dataAfter,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static List<ContractNote> toEntityList(List<ContractNoteDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
