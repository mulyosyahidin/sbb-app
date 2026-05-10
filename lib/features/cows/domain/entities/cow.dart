import 'package:app/features/cows/domain/entities/cow_image.dart';
import 'package:app/features/cows/domain/entities/cow_meta.dart';
import 'package:equatable/equatable.dart';

class Cow extends Equatable {
  final int id;
  final String name;
  final String? description;
  final double weightKg;
  final bool isAvailable;
  final String currentPrice;
  final String featuredImageUrl;
  final List<CowMeta>? metas;
  final List<CowImage>? images;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Cow({
    required this.id,
    required this.name,
    this.description,
    required this.weightKg,
    required this.isAvailable,
    required this.currentPrice,
    required this.featuredImageUrl,
    this.metas,
    this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        weightKg,
        isAvailable,
        currentPrice,
        featuredImageUrl,
        metas,
        images,
        createdAt,
        updatedAt,
      ];
}
