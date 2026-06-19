import 'package:equatable/equatable.dart';

class CompanyBankAccount extends Equatable {
  final String name;
  final String accountNumber;
  final String accountName;

  const CompanyBankAccount({
    required this.name,
    required this.accountNumber,
    required this.accountName,
  });

  @override
  List<Object?> get props => [name, accountNumber, accountName];
}
