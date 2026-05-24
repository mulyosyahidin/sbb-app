import 'package:app/features/account/summary/data/dtos/user_summary_dto.dart';
import 'package:app/features/account/summary/domain/entities/user_summary.dart';

class UserSummaryMapper {
  static UserSummary toEntity(UserSummaryDto dto) {
    return UserSummary(
      totalContracts: dto.totalContracts,
      totalOwnedCows: dto.totalOwnedCows,
      totalReleasedProfit: dto.totalReleasedProfit,
    );
  }
}
