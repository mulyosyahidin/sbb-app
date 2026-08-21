import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activity_dto.freezed.dart';
part 'user_activity_dto.g.dart';

@freezed
abstract class UserActivityDto with _$UserActivityDto {
  const factory UserActivityDto({
    required int id,
    required String iconName,
    required String color,
    required String title,
    required String description,
    String? highlightedText,
    Map<String, dynamic>? data,
    required DateTime createdAt,
  }) = _UserActivityDto;

  factory UserActivityDto.fromJson(Map<String, dynamic> json) =>
      _$UserActivityDtoFromJson(json);
}
