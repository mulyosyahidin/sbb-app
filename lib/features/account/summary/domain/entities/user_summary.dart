import 'package:equatable/equatable.dart';

class UserSummary extends Equatable {
  final int totalContracts;
  final int totalOwnedCows;
  final double totalReleasedProfit;

  const UserSummary({
    required this.totalContracts,
    required this.totalOwnedCows,
    required this.totalReleasedProfit,
  });

  @override
  List<Object?> get props => [
        totalContracts,
        totalOwnedCows,
        totalReleasedProfit,
      ];
}
