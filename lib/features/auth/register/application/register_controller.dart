import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/data/mappers/user_device_mapper.dart';
import 'package:app/core/domain/entities/user_device.dart';
import 'package:app/core/services/device_info_service.dart';
import 'package:app/core/services/fcm_service.dart';
import 'package:app/features/auth/register/data/dto/requests/register_request_dto.dart';
import 'package:app/features/auth/register/data/repositories/register_repository_impl.dart';
import 'package:app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  RegisterRepository get _repository => ref.watch(registerRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final fcmToken = await ref.read(fetchFcmTokenProvider.future);
      final deviceId = await ref.read(fetchDeviceIdProvider.future);
      final details = await ref.read(fetchDeviceDetailsProvider.future);

      if (fcmToken == null || deviceId == null) {
        throw Exception('Failed to get required device information');
      }

      final registerRequestDto = RegisterRequestDto(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        passwordConfirmation: passwordConfirmation,
        fcmToken: fcmToken,
        deviceId: deviceId,
        deviceBrand: details['brand'] ?? 'Unknown',
        deviceModel: details['model'] ?? 'Unknown',
        osBuildId: details['os_build_id'] ?? 'Unknown',
        osVersion: details['os_version'] ?? 'Unknown',
      );

      final result = await _repository.register(registerRequestDto);

      return result.fold(
        (failure) => throw failure,
        (registerUser) async {
          final User user = UserMapper.toEntity(registerUser.userDto);
          final UserDevice userDevice =
              UserDeviceMapper.toEntity(registerUser.userDeviceDto);

          final tokenStorage = ref.read(tokenStorageProvider);
          await tokenStorage.saveUser(user);
          await tokenStorage.saveAccessToken(registerUser.accessToken);
          await tokenStorage.saveDevice(userDevice);

          ref.read(authSessionControllerProvider.notifier).updateSession(
                AuthSession.authenticated(
                  registerUser.accessToken,
                  user,
                ),
              );
        },
      );
    });
  }
}
