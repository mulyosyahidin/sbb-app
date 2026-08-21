import 'package:app/core/models/api_response_dto.dart';
import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/profit/data/dtos/profit_monthly_paid_dto.dart';
import 'package:app/features/profit/data/dtos/profit_payment_history_dto.dart';
import 'package:app/features/profit/data/dtos/profit_summary_dto.dart';

class GetProfitResponseData {
  final ProfitSummaryDto summary;
  final List<ProfitMonthlyPaidDto> last6MonthsPaid;
  final List<ProfitPaymentHistoryDto> paymentHistories;
  final PaginationDto pagination;

  const GetProfitResponseData({
    required this.summary,
    required this.last6MonthsPaid,
    required this.paymentHistories,
    required this.pagination,
  });

  factory GetProfitResponseData.fromJson(Map<String, dynamic> json) {
    return GetProfitResponseData(
      summary: ProfitSummaryDto.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
      last6MonthsPaid: (json['last_6_months_paid'] as List<dynamic>? ?? [])
          .map((item) =>
              ProfitMonthlyPaidDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      paymentHistories: (json['payment_histories'] as List<dynamic>? ?? [])
          .map((item) =>
              ProfitPaymentHistoryDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      pagination: PaginationDto.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
}

class GetProfitResponseDto extends ApiResponseDto<GetProfitResponseData> {
  GetProfitResponseDto({
    required super.success,
    required super.message,
    super.data,
    super.errors,
  });

  factory GetProfitResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => GetProfitResponseData.fromJson(data as Map<String, dynamic>),
    );

    return GetProfitResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
      errors: base.errors,
    );
  }
}
