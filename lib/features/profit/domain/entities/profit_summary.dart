import 'package:equatable/equatable.dart';

class ProfitSummary extends Equatable {
  final double totalPotentialProfit;
  final double paid;
  final double waiting;

  const ProfitSummary({
    required this.totalPotentialProfit,
    required this.paid,
    required this.waiting,
  });

  @override
  List<Object?> get props => [
        totalPotentialProfit,
        paid,
        waiting,
      ];
}
