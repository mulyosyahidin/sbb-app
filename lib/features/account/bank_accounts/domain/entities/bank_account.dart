import 'package:equatable/equatable.dart';

class BankAccount extends Equatable {
  final String id;
  final String userId;
  final bool isPrimary;
  final String accountName;
  final String accountNumber;
  final String bankName;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BankAccount({
    required this.id,
    required this.userId,
    required this.isPrimary,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        isPrimary,
        accountName,
        accountNumber,
        bankName,
        note,
        createdAt,
        updatedAt,
      ];
}
