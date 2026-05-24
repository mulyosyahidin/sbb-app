import 'package:equatable/equatable.dart';

class ProfitMonthlyPaid extends Equatable {
  final String month;
  final String label;
  final double totalPaid;

  const ProfitMonthlyPaid({
    required this.month,
    required this.label,
    required this.totalPaid,
  });

  @override
  List<Object?> get props => [
        month,
        label,
        totalPaid,
      ];
}
