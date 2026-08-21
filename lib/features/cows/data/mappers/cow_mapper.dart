import 'package:app/features/cows/data/dtos/cow_dto.dart';
import 'package:app/features/cows/data/dtos/cow_image_dto.dart';
import 'package:app/features/cows/data/dtos/cow_meta_dto.dart';
import 'package:app/features/cows/domain/entities/cow.dart';
import 'package:app/features/cows/domain/entities/cow_image.dart';
import 'package:app/features/cows/domain/entities/cow_meta.dart';

class CowMapper {
  static Cow toEntity(CowDto dto) {
    return Cow(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      weightKg: dto.weightKg ?? 0.0,
      isAvailable: dto.isAvailable,
      currentPrice: dto.currentPrice,
      featuredImageUrl: dto.featuredImageUrl,
      metas: dto.metas?.map(toMetaEntity).toList(),
      images: dto.images?.map(toImageEntity).toList(),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static CowMeta toMetaEntity(CowMetaDto dto) {
    return CowMeta(
      key: dto.key,
      value: dto.value,
    );
  }

  static CowImage toImageEntity(CowImageDto dto) {
    return CowImage(
      id: dto.id,
      url: dto.url,
    );
  }

  static List<Cow> toEntityList(List<CowDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
