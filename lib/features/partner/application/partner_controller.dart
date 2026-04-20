import 'package:app/features/partner/data/mappers/partner_mapper.dart';
import 'package:app/features/partner/data/repositories/partner_repository_impl.dart';
import 'package:app/features/partner/domain/entities/partner.dart';
import 'package:app/features/partner/domain/repositories/partner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_controller.g.dart';

@riverpod
class PartnerController extends _$PartnerController {
  PartnerRepository get _repository => ref.watch(partnerRepositoryProvider);

  @override
  FutureOr<Partner?> build() async {
    return _init();
  }

  Future<Partner?> _init() async {
    final checkResult = await _repository.checkPartner();

    return await checkResult.fold(
      (l) => throw l,
      (r) async {
        if (!r.hasPartner) {
          return null;
        }

        final partnerResult = await _repository.getPartner();
        return partnerResult.fold(
          (l) => throw l,
          (r) => PartnerMapper.fromDto(r.partner),
        );
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _init());
  }
}
