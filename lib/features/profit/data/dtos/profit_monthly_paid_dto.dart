import 'package:app/core/utils/json_converters.dart';

class ProfitMonthlyPaidDto {
  final String month;
  final String label;
  final double totalPaid;

  const ProfitMonthlyPaidDto({
    required this.month,
    required this.label,
    required this.totalPaid,
  });

  factory ProfitMonthlyPaidDto.fromJson(Map<String, dynamic> json) {
    return ProfitMonthlyPaidDto(
      month: json['month'] as String? ?? '',
      label: json['label'] as String? ?? '',
      totalPaid:
          const DoubleStringConverter().fromJson(json['total_paid']) ?? 0,
    );
  }
}
