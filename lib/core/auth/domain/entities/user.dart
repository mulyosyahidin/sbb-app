class User {
  final int id;
  final String name;
  final String email;
  final String? profilePictureUrl;
  final String? driver;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
    this.driver,
    required this.createdAt,
    required this.updatedAt,
  });
}
