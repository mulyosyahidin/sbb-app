import 'package:app/core/utils/json_converters.dart';

class PaymentScheduleDto {
  final int id;
  final DateTime date;
  final double nominal;
  final String status;

  const PaymentScheduleDto({
    required this.id,
    required this.date,
    required this.nominal,
    required this.status,
  });

  factory PaymentScheduleDto.fromJson(Map<String, dynamic> json) {
    return PaymentScheduleDto(
      id: const IntStringConverter().fromJson(json['id']) ?? 0,
      date: DateTime.parse(json['date'] as String),
      nominal: const DoubleStringConverter().fromJson(json['nominal']) ?? 0,
      status: json['status'] as String? ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'nominal': nominal,
      'status': status,
    };
  }
}
