import 'package:equatable/equatable.dart';

class GalleryItem extends Equatable {
  final int id;
  final String? caption;
  final String? imageUrl;
  final String? featuredImageUrl;

  const GalleryItem({
    required this.id,
    this.caption,
    this.imageUrl,
    this.featuredImageUrl,
  });

  @override
  List<Object?> get props => [id, caption, imageUrl, featuredImageUrl];
}
