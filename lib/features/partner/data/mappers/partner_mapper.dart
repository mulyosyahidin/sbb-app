import 'package:app/features/partner/data/dtos/partner_dto.dart';
import 'package:app/features/partner/domain/entities/partner.dart';
import 'package:intl/intl.dart';

class PartnerMapper {
  static Partner fromDto(PartnerDto dto) {
    return Partner(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
      nik: dto.nik,
      phoneNumber: dto.phoneNumber,
      address: dto.address,
      joinDate: DateTime.parse(dto.joinDate),
      level: dto.level,
      levelLabel: dto.level == 'partner' ? 'Mitra' : 'Partner & Konsultan',
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static PartnerDto toDto(Partner entity) {
    return PartnerDto(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      nik: entity.nik,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      joinDate: DateFormat('yyyy-MM-dd').format(entity.joinDate),
      level: entity.level,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
