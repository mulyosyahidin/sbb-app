import 'package:app/core/domain/entities/app_file.dart';
import 'package:equatable/equatable.dart';

class ContractPaymentProof extends Equatable {
  final int id;
  final int contractId;
  final int fileId;
  final AppFile? file;
  final String bankName;
  final String bankAccountName;
  final String bankAccountNumber;
  final double nominal;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ContractPaymentProof({
    required this.id,
    required this.contractId,
    required this.fileId,
    this.file,
    required this.bankName,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.nominal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        contractId,
        fileId,
        file,
        bankName,
        bankAccountName,
        bankAccountNumber,
        nominal,
        status,
        createdAt,
        updatedAt,
      ];
}
