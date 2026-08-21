import 'package:app/core/utils/json_converters.dart';
import 'package:app/features/cows/data/dtos/cow_image_dto.dart';
import 'package:app/features/cows/data/dtos/cow_meta_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cow_dto.freezed.dart';
part 'cow_dto.g.dart';

@freezed
abstract class CowDto with _$CowDto {
  const factory CowDto({
    required int id,
    required String name,
    String? description,
    @DoubleStringConverter() required double? weightKg,
    required bool isAvailable,
    required String currentPrice,
    required String featuredImageUrl,
    List<CowMetaDto>? metas,
    List<CowImageDto>? images,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CowDto;

  factory CowDto.fromJson(Map<String, dynamic> json) =>
      _$CowDtoFromJson(json);
}
