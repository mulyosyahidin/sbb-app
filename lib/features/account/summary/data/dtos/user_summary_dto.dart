import 'package:app/core/utils/json_converters.dart';

class UserSummaryDto {
  final int totalContracts;
  final int totalOwnedCows;
  final double totalReleasedProfit;

  const UserSummaryDto({
    required this.totalContracts,
    required this.totalOwnedCows,
    required this.totalReleasedProfit,
  });

  factory UserSummaryDto.fromJson(Map<String, dynamic> json) {
    return UserSummaryDto(
      totalContracts:
          const IntStringConverter().fromJson(json['total_contracts']) ?? 0,
      totalOwnedCows:
          const IntStringConverter().fromJson(json['total_owned_cows']) ?? 0,
      totalReleasedProfit: const DoubleStringConverter()
              .fromJson(json['total_released_profit']) ??
          0,
    );
  }
}
