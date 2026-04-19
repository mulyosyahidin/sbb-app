import 'package:app/app/navigation_keys.dart';
import 'package:app/app/presentation/navigation_layout.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/summary/presentation/screens/account_page.dart';
import 'package:app/features/account/edit_profile/presentation/screens/edit_profile_page.dart';
import 'package:app/features/auth/login/presentation/screens/login_page.dart';
import 'package:app/features/auth/register/presentation/screens/register_page.dart';
import 'package:app/features/contract/presentation/screens/contract_page.dart';
import 'package:app/features/gallery/presentation/screens/gallery_page.dart';
import 'package:app/features/home/presentation/screens/home_page.dart';
import 'package:app/features/home_guest/presentation/screens/home_guest_page.dart';
import 'package:app/features/profit/presentation/screens/profit_page.dart';
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
  static const homeGate = "/home-gate";
  static const home = "/home";
  static const contract = "/contract";
  static const profit = "/profit";
  static const gallery = "/gallery";
  static const account = "/account";
  static const editProfile = "/edit-profile";
  static const homeGuest = "/home-guest";

  static const authenticatedRoutes = [
    home,
    contract,
    profit,
    gallery,
    account,
    editProfile,
  ];
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
        path: Routes.homeGuest,
        builder: (context, state) => const HomeGuestPage(),
      ),
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => const EditProfilePage(),
      ),

      // AUTHENTICATED TABS
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.contract,
                builder: (context, state) => const ContractPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profit,
                builder: (context, state) => const ProfitPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.gallery,
                builder: (context, state) => const GalleryPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.account,
                builder: (context, state) => const AccountPage(),
              ),
            ],
          ),
        ],
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

    final isOnSplashPage = location == Routes.splash;

    if (session.isLoading) {
      return null;
    }

    final isAuthenticated = session.maybeWhen(
      data: (auth) => auth.isAuthenticated,
      orElse: () => false,
    );

    LoggerUtil.info(
        "Redirect Check: location=$location, authenticated=$isAuthenticated");

    if (isAuthenticated) {
      if (isOnSplashPage ||
          location == Routes.welcome ||
          location == Routes.login ||
          location == Routes.register ||
          location == Routes.homeGuest) {
        return Routes.home;
      }
    }

    if (!isAuthenticated) {
      if (isOnSplashPage) {
        return Routes.welcome;
      }

      if (Routes.authenticatedRoutes.contains(location)) {
        return Routes.welcome;
      }
    }

    return null;
  }
}
