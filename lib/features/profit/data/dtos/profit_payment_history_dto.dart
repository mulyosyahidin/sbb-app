import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/utils/json_converters.dart';

class ProfitPaymentHistoryDto {
  final int id;
  final int contractId;
  final String contractNumber;
  final DateTime date;
  final double nominal;
  final String status;
  final DateTime? paidAt;
  final double? paidNominal;
  final String? paymentNote;
  final AppFileDto? paymentProofFile;

  const ProfitPaymentHistoryDto({
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

  factory ProfitPaymentHistoryDto.fromJson(Map<String, dynamic> json) {
    return ProfitPaymentHistoryDto(
      id: const IntStringConverter().fromJson(json['id']) ?? 0,
      contractId: const IntStringConverter().fromJson(json['contract_id']) ?? 0,
      contractNumber: json['contract_number'] as String? ?? '-',
      date: DateTime.parse(json['date'] as String),
      nominal: const DoubleStringConverter().fromJson(json['nominal']) ?? 0,
      status: json['status'] as String? ?? 'pending',
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
      paidNominal: const DoubleStringConverter().fromJson(json['paid_nominal']),
      paymentNote: json['payment_note'] as String?,
      paymentProofFile: json['payment_proof_file'] == null
          ? null
          : AppFileDto.fromJson(
              json['payment_proof_file'] as Map<String, dynamic>,
            ),
    );
  }
}
