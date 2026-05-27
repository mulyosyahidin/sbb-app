import 'package:app/features/home/data/dtos/user_activity_dto.dart';
import 'package:app/features/home/domain/entities/user_activity.dart';

class UserActivityMapper {
  static UserActivity toEntity(UserActivityDto dto) {
    return UserActivity(
      id: dto.id,
      iconName: dto.iconName,
      color: dto.color,
      title: dto.title,
      description: dto.description,
      highlightedText: dto.highlightedText,
      data: dto.data,
      createdAt: dto.createdAt,
    );
  }

  static List<UserActivity> toEntityList(List<UserActivityDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
