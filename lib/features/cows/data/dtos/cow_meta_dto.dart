import 'package:freezed_annotation/freezed_annotation.dart';

part 'cow_meta_dto.freezed.dart';
part 'cow_meta_dto.g.dart';

@freezed
abstract class CowMetaDto with _$CowMetaDto {
  const factory CowMetaDto({
    required String key,
    required String value,
  }) = _CowMetaDto;

  factory CowMetaDto.fromJson(Map<String, dynamic> json) =>
      _$CowMetaDtoFromJson(json);
}
