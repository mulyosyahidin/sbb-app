class ApiEndpoint {
  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login-with-credentials';
  static const String googleLogin = '/auth/login-with-google';
  static const String refreshToken = '/auth/refresh-access-token';
  static const String getMe = '/auth/me';
  static const String logout = '/auth/logout';

  // User
  static const String updateProfilePicture = '/user/update-profile-picture';
  static const String updateProfile = '/user/update-profile';
  static const String updatePassword = '/user/update-password';
}