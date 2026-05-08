import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/auth/domain/entities/user.dart';

class UserMapper {
  static User toEntity(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      profilePictureUrl: dto.profilePictureUrl,
      driver: dto.driver,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      profilePictureUrl: user.profilePictureUrl,
      driver: user.driver,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}
