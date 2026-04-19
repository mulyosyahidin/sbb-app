import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/domain/entities/user_device.dart';

class RegisterUser {
  final User user;
  final UserDevice userDevice;
  final String accessToken;

  RegisterUser({
    required this.user,
    required this.userDevice,
    required this.accessToken,
  });
}
