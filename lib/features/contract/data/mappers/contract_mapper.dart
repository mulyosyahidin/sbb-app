import 'package:app/core/mappers/app_file_mapper.dart';
import 'package:app/features/contract/data/dtos/contract_dto.dart';
import 'package:app/features/contract/data/mappers/contract_note_mapper.dart';
import 'package:app/features/contract/data/mappers/payment_schedule_mapper.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_program.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';

class ContractMapper {
  static Contract toEntity(ContractDto dto) {
    return Contract(
      id: dto.id,
      contractNumber: dto.contractNumber,
      userId: dto.userId,
      userName: dto.userName,
      userIdentityNumber: dto.userIdentityNumber,
      address: dto.address,
      userIdentityNumberFileId: dto.userIdentityNumberFileId,
      userIdentityNumberFile: dto.userIdentityNumberFile != null
          ? AppFileMapper.toEntity(dto.userIdentityNumberFile!)
          : null,
      cowId: dto.cowId,
      cowImageFileId: dto.cowImageFileId,
      cowName: dto.cowName,
      cowPrice: dto.cowPrice,
      cowWeightKg: dto.cowWeightKg,
      cowQuantity: dto.cowQuantity,
      cowTotalPrice: dto.cowTotalPrice,
      bankAccountId: dto.bankAccountId,
      bankName: dto.bankName,
      bankAccountName: dto.bankAccountName,
      bankAccountNumber: dto.bankAccountNumber,
      program:
          dto.program != null ? ContractProgram.fromString(dto.program) : null,
      contractMonthDuration: dto.contractMonthDuration,
      status: ContractStatus.fromString(dto.status),
      note: dto.note,
      profitSharingPercentage: dto.profitSharingPercentage,
      totalProfitPaid: dto.totalProfitPaid,
      totalProfitPaidMonths: dto.totalProfitPaidMonths,
      notes: dto.notes != null
          ? ContractNoteMapper.toEntityList(dto.notes!)
          : null,
      latestNote: dto.latestNote != null
          ? ContractNoteMapper.toEntity(dto.latestNote!)
          : null,
      paymentSchedules: dto.paymentSchedules != null
          ? PaymentScheduleMapper.toEntityList(dto.paymentSchedules!)
          : null,
      startDate: dto.startDate,
      endDate: dto.endDate,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static List<Contract> toEntityList(List<ContractDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
