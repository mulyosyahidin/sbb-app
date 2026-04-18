import 'package:app/features/login/presentation/screens/login_page.dart';
import 'package:app/features/welcome/presentation/screens/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class Routes {
  static const welcome = "/welcome";
  static const login = "/login";
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: Routes.welcome,
    routes: [
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}