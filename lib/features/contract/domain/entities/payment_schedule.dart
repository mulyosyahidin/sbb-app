import 'package:equatable/equatable.dart';

enum PaymentScheduleStatus {
  pending('pending', 'Menunggu'),
  success('berhasil', 'Berhasil');

  final String value;
  final String label;

  const PaymentScheduleStatus(this.value, this.label);

  static PaymentScheduleStatus fromString(String? value) {
    return PaymentScheduleStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => PaymentScheduleStatus.pending,
    );
  }
}

class PaymentSchedule extends Equatable {
  final int id;
  final DateTime date;
  final double nominal;
  final PaymentScheduleStatus status;

  const PaymentSchedule({
    required this.id,
    required this.date,
    required this.nominal,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        nominal,
        status,
      ];
}
