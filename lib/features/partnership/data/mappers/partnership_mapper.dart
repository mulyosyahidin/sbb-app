import 'package:app/features/partnership/data/dtos/partnership_application_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_application_review_dto.dart';
import 'package:app/features/partnership/data/dtos/partnership_dto.dart';
import 'package:app/features/partnership/domain/entities/partnership.dart';
import 'package:app/features/partnership/domain/entities/partnership_application.dart';
import 'package:app/features/partnership/domain/entities/partnership_application_review.dart';

class PartnershipMapper {
  static Partner toEntity(PartnershipDto dto) {
    return Partner(
      id: dto.id,
      userId: dto.userId,
      level: dto.level,
      levelLabel: dto.levelLabel,
      refferalCode: dto.refferalCode,
      approvedAt: dto.approvedAt,
      approvedBy:
          dto.approvedBy == null ? null : reviewerToEntity(dto.approvedBy!),
      latestApplication: dto.latestApplication == null
          ? null
          : applicationToEntity(dto.latestApplication!),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static PartnershipApplication applicationToEntity(
    PartnershipApplicationDto dto,
  ) {
    return PartnershipApplication(
      id: dto.id,
      userId: dto.userId,
      fromLevel: dto.fromLevel,
      fromLevelLabel: dto.fromLevelLabel,
      toLevel: dto.toLevel,
      toLevelLabel: dto.toLevelLabel,
      type: dto.type,
      typeLabel: dto.typeLabel,
      status: dto.status,
      statusLabel: dto.statusLabel,
      name: dto.name,
      nik: dto.nik,
      address: dto.address,
      identityCardFile: dto.identityCardFile == null
          ? null
          : PartnershipIdentityCardFile(
              id: dto.identityCardFile!.id,
              fileName: dto.identityCardFile!.fileName,
              fileType: dto.identityCardFile!.fileType,
              fileSize: dto.identityCardFile!.fileSize,
              fileUrl: dto.identityCardFile!.fileUrl,
            ),
      note: dto.note,
      submittedAt: dto.submittedAt,
      lastSubmittedAt: dto.lastSubmittedAt,
      reviewedAt: dto.reviewedAt,
      reviewedBy:
          dto.reviewedBy == null ? null : reviewerToEntity(dto.reviewedBy!),
      reviews: dto.reviews.map(reviewToEntity).toList(),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static PartnershipApplicationReview reviewToEntity(
    PartnershipApplicationReviewDto dto,
  ) {
    return PartnershipApplicationReview(
      id: dto.id,
      status: dto.status,
      statusLabel: dto.statusLabel,
      note: dto.note,
      dataSnapshot: dto.dataSnapshot,
      reviewedAt: dto.reviewedAt,
      reviewedBy:
          dto.reviewedBy == null ? null : reviewerToEntity(dto.reviewedBy!),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static PartnershipReviewer reviewerToEntity(PartnershipReviewerDto dto) {
    return PartnershipReviewer(id: dto.id, name: dto.name);
  }
}
