import 'package:app/features/partner/data/repositories/partner_repository_impl.dart';
import 'package:app/features/partner/domain/repositories/partner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_controller.g.dart';

@Riverpod(keepAlive: true)
class PartnerController extends _$PartnerController {
  PartnerRepository get _repository => ref.watch(partnerRepositoryProvider);

  @override
  FutureOr<bool?> build() => null;

  Future<bool?> checkPartner() async {
    state = await AsyncValue.guard(() async {
      final result = await _repository.checkPartner();

      return result.fold(
        (l) => throw l,
        (r) => r.hasPartner,
      );
    });
    return state.value;
  }
}
