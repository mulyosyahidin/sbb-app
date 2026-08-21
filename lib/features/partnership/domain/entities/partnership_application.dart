import 'package:equatable/equatable.dart';

import 'partnership_application_review.dart';

class PartnershipApplication extends Equatable {
  final int id;
  final int userId;
  final int? fromLevel;
  final String? fromLevelLabel;
  final int toLevel;
  final String toLevelLabel;
  final String type;
  final String typeLabel;
  final String status;
  final String statusLabel;
  final String name;
  final String nik;
  final String address;
  final PartnershipIdentityCardFile? identityCardFile;
  final String? note;
  final String? submittedAt;
  final String? lastSubmittedAt;
  final String? reviewedAt;
  final PartnershipReviewer? reviewedBy;
  final List<PartnershipApplicationReview> reviews;
  final String? createdAt;
  final String? updatedAt;

  const PartnershipApplication({
    required this.id,
    required this.userId,
    this.fromLevel,
    this.fromLevelLabel,
    required this.toLevel,
    required this.toLevelLabel,
    required this.type,
    required this.typeLabel,
    required this.status,
    required this.statusLabel,
    required this.name,
    required this.nik,
    required this.address,
    this.identityCardFile,
    this.note,
    this.submittedAt,
    this.lastSubmittedAt,
    this.reviewedAt,
    this.reviewedBy,
    this.reviews = const [],
    this.createdAt,
    this.updatedAt,
  });

  bool get isPending => status.toLowerCase() == 'pending';
  bool get isRejected => status.toLowerCase() == 'rejected';

  @override
  List<Object?> get props => [
        id,
        userId,
        fromLevel,
        fromLevelLabel,
        toLevel,
        toLevelLabel,
        type,
        typeLabel,
        status,
        statusLabel,
        name,
        nik,
        address,
        identityCardFile,
        note,
        submittedAt,
        lastSubmittedAt,
        reviewedAt,
        reviewedBy,
        reviews,
        createdAt,
        updatedAt,
      ];
}

class PartnershipIdentityCardFile extends Equatable {
  final int id;
  final String fileName;
  final String fileType;
  final String fileSize;
  final String fileUrl;

  const PartnershipIdentityCardFile({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.fileSize,
    required this.fileUrl,
  });

  @override
  List<Object?> get props => [id, fileName, fileType, fileSize, fileUrl];
}
