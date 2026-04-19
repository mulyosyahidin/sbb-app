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

  // Bank Accounts
  static const String getAllPaginatedBankAccounts = '/user/bank-accounts';
  static const String getAllBankAccounts = '/user/bank-accounts/all';
  static const String markAsPrimary = '/user/bank-accounts/{id}/mark-as-primary';
  static const String storeBankAccount = '/user/bank-accounts';
  static const String updateBankAccount = '/user/bank-accounts/{id}';
  static const String deleteBankAccount = '/user/bank-accounts/{id}';
}