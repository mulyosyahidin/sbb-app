import 'package:equatable/equatable.dart';

import 'partnership_application.dart';
import 'partnership_application_review.dart';

class Partner extends Equatable {
  final int id;
  final int userId;
  final int level;
  final String levelLabel;
  final String? refferalCode;
  final String? approvedAt;
  final PartnershipReviewer? approvedBy;
  final PartnershipApplication? latestApplication;
  final String? createdAt;
  final String? updatedAt;

  const Partner({
    required this.id,
    required this.userId,
    required this.level,
    required this.levelLabel,
    this.refferalCode,
    this.approvedAt,
    this.approvedBy,
    this.latestApplication,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        level,
        levelLabel,
        refferalCode,
        approvedAt,
        approvedBy,
        latestApplication,
        createdAt,
        updatedAt,
      ];
}
