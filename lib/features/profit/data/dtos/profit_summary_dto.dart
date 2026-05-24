import 'package:app/core/utils/json_converters.dart';

class ProfitSummaryDto {
  final double totalPotentialProfit;
  final double paid;
  final double waiting;

  const ProfitSummaryDto({
    required this.totalPotentialProfit,
    required this.paid,
    required this.waiting,
  });

  factory ProfitSummaryDto.fromJson(Map<String, dynamic> json) {
    return ProfitSummaryDto(
      totalPotentialProfit: const DoubleStringConverter()
              .fromJson(json['total_potential_profit']) ??
          0,
      paid: const DoubleStringConverter().fromJson(json['paid']) ?? 0,
      waiting: const DoubleStringConverter().fromJson(json['waiting']) ?? 0,
    );
  }
}
