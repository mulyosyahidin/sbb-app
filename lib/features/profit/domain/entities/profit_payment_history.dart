import 'package:app/core/domain/entities/app_file.dart';
import 'package:equatable/equatable.dart';

class ProfitPaymentHistory extends Equatable {
  final int id;
  final int contractId;
  final String contractNumber;
  final DateTime date;
  final double nominal;
  final String status;
  final DateTime? paidAt;
  final double? paidNominal;
  final String? paymentNote;
  final AppFile? paymentProofFile;

  const ProfitPaymentHistory({
    required this.id,
    required this.contractId,
    required this.contractNumber,
    required this.date,
    required this.nominal,
    required this.status,
    this.paidAt,
    this.paidNominal,
    this.paymentNote,
    this.paymentProofFile,
  });

  @override
  List<Object?> get props => [
        id,
        contractId,
        contractNumber,
        date,
        nominal,
        status,
        paidAt,
        paidNominal,
        paymentNote,
        paymentProofFile,
      ];
}
