import 'package:app/core/domain/entities/app_file.dart';
import 'package:app/features/contract/domain/entities/contract_document.dart';
import 'package:app/features/contract/domain/entities/contract_note.dart';
import 'package:app/features/contract/domain/entities/contract_program.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/features/contract/domain/entities/payment_schedule.dart';
import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final int id;
  final String? contractNumber;
  final int userId;
  final String? userName;
  final String? userIdentityNumber;
  final String? address;
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
  final double? totalProfitPaid;
  final int? totalProfitPaidMonths;
  final List<ContractNote>? notes;
  final ContractNote? latestNote;
  final List<PaymentSchedule>? paymentSchedules;
  final List<ContractDocument>? contractDocuments;
  final ContractDocument? latestContractDocument;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isDocumentAccepted;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Contract({
    required this.id,
    this.contractNumber,
    required this.userId,
    this.userName,
    this.userIdentityNumber,
    this.address,
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
    this.totalProfitPaid,
    this.totalProfitPaidMonths,
    this.notes,
    this.latestNote,
    this.paymentSchedules,
    this.contractDocuments,
    this.latestContractDocument,
    this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.isDocumentAccepted,
  });

  @override
  List<Object?> get props => [
        id,
        contractNumber,
        userId,
        userName,
        userIdentityNumber,
        address,
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
        totalProfitPaid,
        totalProfitPaidMonths,
        notes,
        latestNote,
        paymentSchedules,
        contractDocuments,
        latestContractDocument,
        startDate,
        endDate,
        isDocumentAccepted,
        createdAt,
        updatedAt,
      ];
}
