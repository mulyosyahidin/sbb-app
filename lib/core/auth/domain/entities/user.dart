class User {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? phoneNumber;
  final String? driver;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.phoneNumber,
    this.driver,
    required this.createdAt,
    required this.updatedAt,
  });
}
