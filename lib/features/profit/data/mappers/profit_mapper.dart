import 'package:app/core/mappers/app_file_mapper.dart';
import 'package:app/features/profit/data/dtos/profit_monthly_paid_dto.dart';
import 'package:app/features/profit/data/dtos/profit_payment_history_dto.dart';
import 'package:app/features/profit/data/dtos/profit_summary_dto.dart';
import 'package:app/features/profit/data/dtos/responses/get_profit_response_dto.dart';
import 'package:app/features/profit/domain/entities/profit.dart';
import 'package:app/features/profit/domain/entities/profit_monthly_paid.dart';
import 'package:app/features/profit/domain/entities/profit_payment_history.dart';
import 'package:app/features/profit/domain/entities/profit_summary.dart';

class ProfitMapper {
  static Profit toEntity(GetProfitResponseData dto) {
    return Profit(
      summary: summaryToEntity(dto.summary),
      last6MonthsPaid: dto.last6MonthsPaid.map(monthlyPaidToEntity).toList(),
      paymentHistories:
          dto.paymentHistories.map(paymentHistoryToEntity).toList(),
      pagination: dto.pagination,
    );
  }

  static ProfitSummary summaryToEntity(ProfitSummaryDto dto) {
    return ProfitSummary(
      totalPotentialProfit: dto.totalPotentialProfit,
      paid: dto.paid,
      waiting: dto.waiting,
    );
  }

  static ProfitMonthlyPaid monthlyPaidToEntity(ProfitMonthlyPaidDto dto) {
    return ProfitMonthlyPaid(
      month: dto.month,
      label: dto.label,
      totalPaid: dto.totalPaid,
    );
  }

  static ProfitPaymentHistory paymentHistoryToEntity(
    ProfitPaymentHistoryDto dto,
  ) {
    return ProfitPaymentHistory(
      id: dto.id,
      contractId: dto.contractId,
      contractNumber: dto.contractNumber,
      date: dto.date,
      nominal: dto.nominal,
      status: dto.status,
      paidAt: dto.paidAt,
      paidNominal: dto.paidNominal,
      paymentNote: dto.paymentNote,
      paymentProofFile: dto.paymentProofFile == null
          ? null
          : AppFileMapper.toEntity(dto.paymentProofFile!),
    );
  }
}
