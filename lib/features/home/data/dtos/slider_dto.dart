import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_dto.freezed.dart';
part 'slider_dto.g.dart';

@freezed
abstract class SliderDto with _$SliderDto {
  const factory SliderDto({
    required int id,
    required String tag,
    required String title,
    required String subTitle,
    required String imageUrl,
    String? url,
    required int sequence,
  }) = _SliderDto;

  factory SliderDto.fromJson(Map<String, dynamic> json) =>
      _$SliderDtoFromJson(json);
}
