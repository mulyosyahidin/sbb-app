import 'package:app/core/auth/domain/entities/auth_driver.dart';
import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/auth/domain/entities/user.dart';

class UserMapper {
  static User toEntity(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      profilePictureFileId: dto.profilePictureFileId,
      role: dto.role,
      profilePictureUrl: dto.profilePictureUrl,
      driver: AuthDriver.fromString(dto.driver),
      emailVerifiedAt: dto.emailVerifiedAt,
      twoFactorConfirmedAt: dto.twoFactorConfirmedAt,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      profilePictureFileId: user.profilePictureFileId,
      role: user.role,
      profilePictureUrl: user.profilePictureUrl,
      driver: user.driver.value,
      emailVerifiedAt: user.emailVerifiedAt,
      twoFactorConfirmedAt: user.twoFactorConfirmedAt,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }


}
