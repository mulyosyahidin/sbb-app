import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_file_dto.freezed.dart';
part 'app_file_dto.g.dart';

@freezed
abstract class AppFileDto with _$AppFileDto {
  const factory AppFileDto({
    required int id,
    int? userId,
    required String fileName,
    required String fileType,
    required int fileSize,
    required String fileUrl,
  }) = _AppFileDto;

  factory AppFileDto.fromJson(Map<String, dynamic> json) =>
      _$AppFileDtoFromJson(json);
}
