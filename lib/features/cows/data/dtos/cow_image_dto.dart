import 'package:freezed_annotation/freezed_annotation.dart';

part 'cow_image_dto.freezed.dart';
part 'cow_image_dto.g.dart';

@freezed
abstract class CowImageDto with _$CowImageDto {
  const factory CowImageDto({
    required int id,
    required String url,
  }) = _CowImageDto;

  factory CowImageDto.fromJson(Map<String, dynamic> json) =>
      _$CowImageDtoFromJson(json);
}
