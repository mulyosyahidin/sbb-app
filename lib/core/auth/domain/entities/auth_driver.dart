enum AuthDriver {
  email('Email'),
  google('Google');

  final String value;
  const AuthDriver(this.value);

  static AuthDriver fromString(String? value) {
    return AuthDriver.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AuthDriver.email,
    );
  }
}
