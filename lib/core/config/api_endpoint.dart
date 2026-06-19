class ApiEndpoint {
  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login-with-email';
  static const String googleLogin = '/auth/login-with-google';
  static const String refreshToken = '/auth/refresh-access-token';
  static const String getMe = '/auth/me';
  static const String logout = '/auth/logout';

  // User
  static const String updateProfilePicture = '/user/update-profile-picture';
  static const String updateProfile = '/user/update-profile';
  static const String updatePassword = '/user/update-password';
  static const String resendVerificationEmail =
      '/user/resend-verification-email';
  static const String getUserSummary = '/user/summary';
  static const String getUserActivities = '/user/activities';

  // Bank Accounts
  static const String getAllPaginatedBankAccounts = '/user/bank-accounts';
  static const String getAllBankAccounts = '/user/bank-accounts/all';
  static const String markAsPrimary =
      '/user/bank-accounts/{id}/mark-as-primary';
  static const String storeBankAccount = '/user/bank-accounts';
  static const String updateBankAccount = '/user/bank-accounts/{id}';
  static const String deleteBankAccount = '/user/bank-accounts/{id}';

  // Partnership
  static const String checkPartner = '/user/partner/check';
  static const String getPartnershipApplications = '/user/partner/applications';
  static const String storePartnershipApplication =
      '/user/partner/applications';
  static const String getPartnershipApplicationById =
      '/user/partner/applications/{application}';
  static const String updatePartnershipApplication =
      '/user/partner/applications/{application}';

  // Home Page
  static const String getSliders = '/home-page/sliders';

  // Gallery
  static const String getAllGalleries = '/photo-galleries';
  static const String getGalleryById = '/photo-galleries/{id}';

  // Cows
  static const String getAllCows = '/cows';
  static const String getCowById = '/cows/{id}';

  // Web View
  static const String companyProfileWebView = '/webview/company-profile';

  // Profit
  static const String getProfit = '/profits';

  // Contracts
  static const String checkContractDraft = '/contracts/draft/check';
  static const String getContractDraft = '/contracts/draft';
  static const String saveContractDraft = '/contracts/draft/save';
  static const String getContracts = '/contracts';
  static const String submitContract = '/contracts/draft/submit';
  static const String getContractById = '/contracts/{id}';
  static const String storeContractPaymentProof =
      '/contracts/{contract}/payment-proofs';
  static const String getContractDocument = '/contracts/{contract}/email-pdf';
  static const String sendContractDocument = '/contracts/{contract}/send-contract-document';
  static const String uploadContractDocument = '/contracts/{contract}/documents';

  // Preference
  static const String preferenceBankAccount = '/preference/bank-account';
}
