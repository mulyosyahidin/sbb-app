import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/profit/domain/entities/profit_monthly_paid.dart';
import 'package:app/features/profit/domain/entities/profit_payment_history.dart';
import 'package:app/features/profit/domain/entities/profit_summary.dart';
import 'package:equatable/equatable.dart';

class Profit extends Equatable {
  final ProfitSummary summary;
  final List<ProfitMonthlyPaid> last6MonthsPaid;
  final List<ProfitPaymentHistory> paymentHistories;
  final PaginationDto pagination;

  const Profit({
    required this.summary,
    required this.last6MonthsPaid,
    required this.paymentHistories,
    required this.pagination,
  });

  @override
  List<Object?> get props => [
        summary,
        last6MonthsPaid,
        paymentHistories,
        pagination,
      ];
}
