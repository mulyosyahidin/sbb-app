import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/domain/entities/user_device.dart';

class LoginUser {
  final User user;
  final UserDevice userDevice;
  final String accessToken;

  LoginUser({
    required this.user,
    required this.userDevice,
    required this.accessToken,
  });
}
