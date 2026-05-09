import 'package:app/core/auth/domain/entities/auth_driver.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final int? profilePictureFileId;
  final String? role;
  final String? profilePictureUrl;
  final AuthDriver driver;

  final DateTime? emailVerifiedAt;
  final DateTime? twoFactorConfirmedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureFileId,
    this.role,
    this.profilePictureUrl,
    required this.driver,

    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        profilePictureFileId,
        role,
        profilePictureUrl,
        driver,
        emailVerifiedAt,
        twoFactorConfirmedAt,
        createdAt,
        updatedAt,
      ];
}

