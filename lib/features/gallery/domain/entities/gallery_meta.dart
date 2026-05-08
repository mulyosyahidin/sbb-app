import 'package:equatable/equatable.dart';

class GalleryMeta extends Equatable {
  final int id;
  final String icon;
  final String title;
  final String content;

  const GalleryMeta({
    required this.id,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [id, icon, title, content];
}
