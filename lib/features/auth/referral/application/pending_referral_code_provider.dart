import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_referral_code_provider.g.dart';

@Riverpod(keepAlive: true)
class PendingReferralCode extends _$PendingReferralCode {
  @override
  bool build() => false;

  void setPending(bool value) {
    state = value;
  }
}
