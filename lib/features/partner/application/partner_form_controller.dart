import 'package:app/features/partner/application/partner_controller.dart';
import 'package:app/features/partner/data/dtos/requests/register_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/requests/update_partner_request_dto.dart';
import 'package:app/features/partner/data/repositories/partner_repository_impl.dart';
import 'package:app/features/partner/domain/repositories/partner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_form_controller.g.dart';

@riverpod
class PartnerFormController extends _$PartnerFormController {
  PartnerRepository get _repository => ref.watch(partnerRepositoryProvider);

  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> registerPartner({
    required String name,
    required String nik,
    required String address,
    required String phoneNumber,
    required String joinDate,
    required String level,
  }) async {
    state = const AsyncLoading();

    final dto = RegisterPartnerRequestDto(
      name: name,
      nik: nik,
      address: address,
      phoneNumber: phoneNumber,
      joinDate: joinDate,
      level: level,
    );

    final result = await _repository.registerPartner(dto);

    state = result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) {
        ref.invalidate(partnerControllerProvider);
        return const AsyncData(null);
      },
    );
  }

  Future<void> updatePartner({
    required String name,
    required String nik,
    required String address,
    required String phoneNumber,
    required String joinDate,
  }) async {
    state = const AsyncLoading();

    final dto = UpdatePartnerRequestDto(
      name: name,
      nik: nik,
      address: address,
      phoneNumber: phoneNumber,
      joinDate: joinDate,
    );

    final result = await _repository.updatePartner(dto);

    state = result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) {
        ref.invalidate(partnerControllerProvider);
        return const AsyncData(null);
      },
    );
  }
}
