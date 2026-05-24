import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/domain/entities/user_device.dart';
import 'package:app/features/home/data/mappers/slider_mapper.dart';
import 'package:app/features/home/data/repositories/slider_repository_impl.dart';
import 'package:app/features/home/domain/entities/slider.dart';
import 'package:app/features/partnership/application/partnership_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

class HomeState {
  final User? user;
  final UserDevice? device;
  final String? accessToken;
  final bool? hasPartner;

  HomeState({
    this.user,
    this.device,
    this.accessToken,
    this.hasPartner,
  });
}

@riverpod
Future<HomeState> fetchHomeData(Ref ref) async {
  final tokenStorage = ref.watch(tokenStorageProvider);

  final user = await tokenStorage.getUser();
  final device = await tokenStorage.getDevice();
  final token = await tokenStorage.getAccessToken();
  final hasPartner = ref.watch(partnerControllerProvider).value?.hasPartner;

  return HomeState(
    user: user,
    device: device,
    accessToken: token,
    hasPartner: hasPartner,
  );
}

@Riverpod(keepAlive: true)
Future<List<Slider>> sliders(Ref ref) async {
  final repository = ref.watch(sliderRepositoryProvider);
  final result = await repository.getSliders();

  return result.fold(
    (l) => throw l,
    (r) => SliderMapper.toEntityList(r.sliders),
  );
}
