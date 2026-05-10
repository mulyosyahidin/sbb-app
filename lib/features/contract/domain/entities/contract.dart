import 'package:app/core/domain/entities/app_file.dart';
import 'package:app/features/contract/domain/entities/contract_program.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final int id;
  final String? contractNumber;
  final int userId;
  final String? userName;
  final String? userIdentityNumber;
  final int? userIdentityNumberFileId;
  final AppFile? userIdentityNumberFile;
  final int? cowId;
  final int? cowImageFileId;
  final String? cowName;
  final double? cowPrice;
  final int? cowWeightKg;
  final int? cowQuantity;
  final double? cowTotalPrice;
  final int? bankAccountId;
  final String? bankName;
  final String? bankAccountName;
  final String? bankAccountNumber;
  final ContractProgram? program;
  final int? contractMonthDuration;
  final ContractStatus status;
  final String? note;
  final double? profitSharingPercentage;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Contract({
    required this.id,
    this.contractNumber,
    required this.userId,
    this.userName,
    this.userIdentityNumber,
    this.userIdentityNumberFileId,
    this.userIdentityNumberFile,
    this.cowId,
    this.cowImageFileId,
    this.cowName,
    this.cowPrice,
    this.cowWeightKg,
    this.cowQuantity,
    this.cowTotalPrice,
    this.bankAccountId,
    this.bankName,
    this.bankAccountName,
    this.bankAccountNumber,
    this.program,
    this.contractMonthDuration,
    required this.status,
    this.note,
    this.profitSharingPercentage,
    this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        contractNumber,
        userId,
        userName,
        userIdentityNumber,
        userIdentityNumberFileId,
        userIdentityNumberFile,
        cowId,
        cowImageFileId,
        cowName,
        cowPrice,
        cowWeightKg,
        cowQuantity,
        cowTotalPrice,
        bankAccountId,
        bankName,
        bankAccountName,
        bankAccountNumber,
        program,
        contractMonthDuration,
        status,
        note,
        profitSharingPercentage,
        startDate,
        endDate,
        createdAt,
        updatedAt,
      ];
}
