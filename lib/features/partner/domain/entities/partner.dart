import 'package:equatable/equatable.dart';

class Partner extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String nik;
  final String phoneNumber;
  final String address;
  final DateTime joinDate;
  final String level;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Partner({
    required this.id,
    required this.userId,
    required this.name,
    required this.nik,
    required this.phoneNumber,
    required this.address,
    required this.joinDate,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        nik,
        phoneNumber,
        address,
        joinDate,
        level,
        createdAt,
        updatedAt,
      ];
}
