import 'dart:io';

class StorePaymentProofRequestDto {
  final File file;
  final String bankName;
  final String bankAccountName;
  final String bankAccountNumber;
  final double nominal;

  StorePaymentProofRequestDto({
    required this.file,
    required this.bankName,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.nominal,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_name': bankName,
      'bank_account_name': bankAccountName,
      'bank_account_number': bankAccountNumber,
      'nominal': nominal,
    };
  }
}
