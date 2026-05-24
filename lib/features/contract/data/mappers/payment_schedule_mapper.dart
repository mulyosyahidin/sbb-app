import 'package:app/features/contract/data/dtos/payment_schedule_dto.dart';
import 'package:app/features/contract/domain/entities/payment_schedule.dart';

class PaymentScheduleMapper {
  static PaymentSchedule toEntity(PaymentScheduleDto dto) {
    return PaymentSchedule(
      id: dto.id,
      date: dto.date,
      nominal: dto.nominal,
      status: PaymentScheduleStatus.fromString(dto.status),
    );
  }

  static List<PaymentSchedule> toEntityList(List<PaymentScheduleDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
