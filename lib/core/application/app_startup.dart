import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/features/home/application/home_controller.dart';
import 'package:app/features/partner/application/partner_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  // 1. Inisialisasi Data Publik (Paralel)
  ref.watch(slidersProvider.future);

  // 2. Pantau Status Sesi
  final authState = ref.watch(authSessionControllerProvider);

  // Gunakan data sesi untuk memicu inisialisasi yang butuh login
  authState.whenData((session) {
    if (session.isAuthenticated) {
      // 3. Inisialisasi Data Terautentikasi
      Future.microtask(() {
        ref.read(partnerControllerProvider.notifier).checkPartner();
      });
    }
  });
}
