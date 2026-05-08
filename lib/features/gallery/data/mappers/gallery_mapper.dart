import 'package:app/features/gallery/data/dtos/gallery_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_item_dto.dart';
import 'package:app/features/gallery/data/dtos/gallery_meta_dto.dart';
import 'package:app/features/gallery/domain/entities/gallery.dart';
import 'package:app/features/gallery/domain/entities/gallery_item.dart';
import 'package:app/features/gallery/domain/entities/gallery_meta.dart';

class GalleryMapper {
  static Gallery toEntity(GalleryDto dto) {
    return Gallery(
      id: dto.id,
      tag: dto.tag,
      title: dto.title,
      content: dto.content,
      featuredImageUrl: dto.featuredImageUrl,
      items: dto.items?.map(toItemEntity).toList(),
      metas: dto.metas?.map(toMetaEntity).toList(),
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
    );
  }

  static GalleryItem toItemEntity(GalleryItemDto dto) {
    return GalleryItem(
      id: dto.id,
      caption: dto.caption,
      imageUrl: dto.imageUrl,
      featuredImageUrl: dto.featuredImageUrl,
    );
  }

  static GalleryMeta toMetaEntity(GalleryMetaDto dto) {
    return GalleryMeta(
      id: dto.id,
      icon: dto.metaIcon.replaceAll('_', ' '),
      title: dto.metaTitle,
      content: dto.metaContent,
    );
  }

  static List<Gallery> toEntityList(List<GalleryDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
