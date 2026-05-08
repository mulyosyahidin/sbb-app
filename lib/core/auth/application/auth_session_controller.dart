import 'package:app/core/auth/application/token_storage.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/data/repositories/auth_repository_impl.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/auth/domain/repositories/auth_repository.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:app/features/home/application/home_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_session_controller.g.dart';

class AuthSession {
  final String? accessToken;
  final User? user;

  const AuthSession({
    this.accessToken,
    this.user,
  });

  factory AuthSession.unauthenticated() => const AuthSession(
        accessToken: null,
        user: null,
      );

  factory AuthSession.authenticated(String accessToken, User user) {
    return AuthSession(accessToken: accessToken, user: user);
  }

  bool get isAuthenticated => accessToken != null && user != null;

  AuthSession copyWith({
    String? accessToken,
    User? user,
  }) {
    return AuthSession(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }
}

@riverpod
class AuthSessionController extends _$AuthSessionController {
  AuthRepository get _authRepository => ref.watch(authRepositoryProvider);

  @override
  Future<AuthSession> build() async {
    final tokenStorage = ref.watch(tokenStorageProvider);
    final accessToken = await tokenStorage.getAccessToken();
    
    ref.read(slidersProvider.future);

    if (accessToken == null) {
      LoggerUtil.debug("AuthSession: No token found. Unauthenticated.");
      return AuthSession.unauthenticated();
    }

    final savedUser = await tokenStorage.getUser();

    try {
      LoggerUtil.debug("AuthSession: Verifying token with NETWORK.");

      final getMe = await _authRepository.getMe();

      return await getMe.fold(
        (failure) async {
          LoggerUtil.warning(
            "AuthSession: Invalid token or error (${failure.message}). Clearing session.",
          );

          await tokenStorage.clearAll();
          return AuthSession.unauthenticated();
        },
        (userValue) async {
          LoggerUtil.success("AuthSession: User verified from NETWORK.");
          final User userEntity = UserMapper.toEntity(userValue.userDto);

          await tokenStorage.saveUser(userEntity);

          return AuthSession.authenticated(accessToken, userEntity);
        },
      );
    } on DioException catch (e, stackTrace) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 401) {
        LoggerUtil.warning(
          "AuthSession: Session expired (401). Clearing session.",
        );
        await tokenStorage.clearAll();
        return AuthSession.unauthenticated();
      }

      if (savedUser != null) {
        LoggerUtil.warning(
          "AuthSession: Network error (Code: $statusCode). Using CACHED user for offline support.",
        );
        return AuthSession.authenticated(accessToken, savedUser);
      }

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'AuthSessionController.build (DioException)',
      );

      LoggerUtil.error(
        "AuthSession: Network error and no cached user. Returning unauthenticated.",
      );
      return AuthSession.unauthenticated();
    } catch (e, stackTrace) {
      LoggerUtil.error("AuthSession: Unexpected error: $e");

      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'AuthSessionController.build (Unexpected Error)',
      );

      if (savedUser != null) {
        LoggerUtil.warning("AuthSession: Falling back to CACHED user.");
        return AuthSession.authenticated(accessToken, savedUser);
      }

      return AuthSession.unauthenticated();
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final tokenStorage = ref.read(tokenStorageProvider);
    final device = await tokenStorage.getDevice();

    if (device != null) {
      await _authRepository.logout(device.id);
    }

    await tokenStorage.clearAll();
    state = AsyncData(
      AuthSession.unauthenticated(),
    );
    LoggerUtil.info("AuthSession: User logged out and session cleared.");
  }

  void updateSession(AuthSession session) {
    state = AsyncData(session);
    LoggerUtil.info("AuthSession: Session updated manually.");
  }

  void updateUser(User user) {
    state.whenData((session) {
      state = AsyncData(
        session.copyWith(user: user),
      );
    });
    LoggerUtil.info("AuthSession: User updated manually.");
  }
}
