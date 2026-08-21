import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_notification_provider.g.dart';

@Riverpod(keepAlive: true)
class PendingNotification extends _$PendingNotification {
  @override
  String? build() => null;

  void setNotification(String? id) {
    state = id;
  }
}
