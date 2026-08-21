import 'package:app/features/gallery/domain/entities/gallery_item.dart';
import 'package:app/features/gallery/domain/entities/gallery_meta.dart';
import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final int id;
  final String tag;
  final String title;
  final String? content;
  final String? featuredImageUrl;
  final List<GalleryItem>? items;
  final List<GalleryMeta>? metas;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Gallery({
    required this.id,
    required this.tag,
    required this.title,
    this.content,
    this.featuredImageUrl,
    this.items,
    this.metas,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        tag,
        title,
        content,
        featuredImageUrl,
        items,
        metas,
        createdAt,
        updatedAt,
      ];
}
