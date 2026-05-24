import 'package:equatable/equatable.dart';

class PartnershipApplicationReview extends Equatable {
  final int id;
  final String status;
  final String statusLabel;
  final String? note;
  final String? dataSnapshot;
  final String? reviewedAt;
  final PartnershipReviewer? reviewedBy;
  final String? createdAt;
  final String? updatedAt;

  const PartnershipApplicationReview({
    required this.id,
    required this.status,
    required this.statusLabel,
    this.note,
    this.dataSnapshot,
    this.reviewedAt,
    this.reviewedBy,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        statusLabel,
        note,
        dataSnapshot,
        reviewedAt,
        reviewedBy,
        createdAt,
        updatedAt,
      ];
}

class PartnershipReviewer extends Equatable {
  final int id;
  final String name;

  const PartnershipReviewer({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
