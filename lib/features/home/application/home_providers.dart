import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/domain/entities/user_device.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

class HomeState {
  final User? user;
  final UserDevice? device;
  final String? accessToken;

  HomeState({
    this.user,
    this.device,
    this.accessToken,
  });
}

@riverpod
Future<HomeState> fetchHomeData(Ref ref) async {
  final tokenStorage = ref.watch(tokenStorageProvider);

  final user = await tokenStorage.getUser();
  final device = await tokenStorage.getDevice();
  final token = await tokenStorage.getAccessToken();

  return HomeState(
    user: user,
    device: device,
    accessToken: token,
  );
}
