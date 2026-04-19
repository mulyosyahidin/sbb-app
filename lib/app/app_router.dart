import 'package:app/app/navigation_keys.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/auth/login/presentation/screens/login_page.dart';
import 'package:app/features/auth/register/presentation/screens/register_page.dart';
import 'package:app/features/home/presentation/screens/home_page.dart';
import 'package:app/features/home_guest/presentation/screens/home_guest_page.dart';
import 'package:app/features/splash/presentation/screens/splash_page.dart';
import 'package:app/features/welcome/presentation/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class Routes {
  static const splash = "/";
  static const welcome = "/welcome";
  static const login = "/login";
  static const register = "/register";
  static const home = "/home";
  static const homeGuest = "/home-guest";
}

@riverpod
GoRouter router(Ref ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: rootNavigatorKey,
    refreshListenable: notifier,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.homeGuest,
        builder: (context, state) => const HomeGuestPage(),
      ),
    ],
    redirect: notifier.redirect,
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(
      authSessionControllerProvider,
      (_, __) => notifyListeners(),
      fireImmediately: true,
    );
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final session = _ref.read(authSessionControllerProvider);
    final location = state.matchedLocation;

    // Is on splash page if location is splash route
    final isOnSplashPage = location == Routes.splash;

    // While session is loading, always stay on or go to splash
    if (session.isLoading) {
      return isOnSplashPage ? null : Routes.splash;
    }

    final isAuthenticated = session.maybeWhen(
      data: (auth) => auth.isAuthenticated,
      orElse: () => false,
    );

    LoggerUtil.info("Redirect Check: location=$location, authenticated=$isAuthenticated");

    // Case: Logged in users trying to access auth pages (splash, welcome, login, register)
    if (isAuthenticated) {
      if (isOnSplashPage ||
          location == Routes.welcome ||
          location == Routes.login ||
          location == Routes.register ||
          location == Routes.homeGuest) {
        return Routes.home;
      }
    }

    // Case: Unauthenticated users
    if (!isAuthenticated) {
      // If they are on splash, take them to welcome
      if (isOnSplashPage) {
        return Routes.welcome;
      }

      // If they are trying to access protected pages (like home), take them to welcome/login
      if (location == Routes.home) {
        return Routes.welcome;
      }
    }

    return null;
  }
}
