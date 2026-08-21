import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/data/mappers/user_device_mapper.dart';
import 'package:app/core/domain/entities/user_device.dart';
import 'package:app/core/services/device_info_service.dart';
import 'package:app/core/services/fcm_service.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/login/application/google_login_service.dart';
import 'package:app/features/auth/login/data/dto/requests/google_login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/requests/login_request_dto.dart';
import 'package:app/features/auth/login/data/dto/responses/login_response_dto.dart';
import 'package:app/features/auth/login/data/repositories/login_repository_impl.dart';
import 'package:app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:app/features/home/application/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:app/features/auth/referral/application/pending_referral_code_provider.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  LoginRepository get _repository => ref.watch(loginRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final fcmToken = await ref.read(fetchFcmTokenProvider.future);
      final deviceId = await ref.read(fetchDeviceIdProvider.future);
      final details = await ref.read(fetchDeviceDetailsProvider.future);

      if (deviceId == null) {
        throw Exception('Failed to get required device information');
      }

      final loginRequestDto = LoginRequestDto(
        email: email,
        password: password,
        fcmToken: fcmToken ?? FcmService.unavailableToken,
        deviceId: deviceId,
        deviceBrand: details['brand'] ?? 'Unknown',
        deviceModel: details['model'] ?? 'Unknown',
        osBuildId: details['os_build_id'] ?? 'Unknown',
        osVersion: details['os_version'] ?? 'Unknown',
      );

      final result = await _repository.login(loginRequestDto);

      return result.fold(
        (failure) => throw failure,
        (data) async {
          await _handleLoginSuccess(data);
        },
      );
    });
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // 1. Google Sign In to get ID Token
      final idToken =
          await ref.read(googleLoginServiceProvider).signInWithGoogle();

      if (idToken == null) {
        // User cancelled login
        return;
      }

      // 2. Gather device info
      final fcmToken = await ref.read(fetchFcmTokenProvider.future);
      final deviceId = await ref.read(fetchDeviceIdProvider.future);
      final details = await ref.read(fetchDeviceDetailsProvider.future);

      if (deviceId == null) {
        throw Exception('Failed to get required device information');
      }

      final googleLoginRequestDto = GoogleLoginRequestDto(
        idToken: idToken,
        fcmToken: fcmToken ?? FcmService.unavailableToken,
        deviceId: deviceId,
        deviceBrand: details['brand'] ?? 'Unknown',
        deviceModel: details['model'] ?? 'Unknown',
        osBuildId: details['os_build_id'] ?? 'Unknown',
        osVersion: details['os_version'] ?? 'Unknown',
      );

      // 3. Hit backend
      final result = await _repository.loginWithGoogle(googleLoginRequestDto);

      return result.fold(
        (failure) => throw failure,
        (data) async {
          // 4. Handle success
          ref.read(pendingReferralCodeProvider.notifier).setPending(true);
          await _handleLoginSuccess(data);
        },
      );
    });
  }

  Future<void> _handleLoginSuccess(LoginResponseData loginResponse) async {
    // Map DTOs to Entities
    final User user = UserMapper.toEntity(loginResponse.userDto);
    final UserDevice device =
        UserDeviceMapper.toEntity(loginResponse.userDeviceDto);

    // Save to storage
    final tokenStorage = ref.read(tokenStorageProvider);
    await tokenStorage.saveUser(user);
    await tokenStorage.saveAccessToken(loginResponse.accessToken);
    await tokenStorage.saveDevice(device);

    // Sync session state
    ref.read(authSessionControllerProvider.notifier).updateSession(
          AuthSession.authenticated(
            loginResponse.accessToken,
            user,
          ),
        );

    // Pre-fetch sliders early
    ref.read(slidersProvider.future);

    LoggerUtil.info('Login success: ${user.email}');
  }
}
