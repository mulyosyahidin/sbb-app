import 'package:app/features/home/data/dtos/slider_dto.dart';
import 'package:app/features/home/domain/entities/slider.dart';

class SliderMapper {
  static Slider toEntity(SliderDto dto) {
    return Slider(
      id: dto.id,
      tag: dto.tag,
      title: dto.title,
      subtitle: dto.subTitle,
      imageUrl: dto.imageUrl,
      url: dto.url,
      sequence: dto.sequence,
    );
  }

  static List<Slider> toEntityList(List<SliderDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}
