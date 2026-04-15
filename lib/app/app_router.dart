import 'package:app/app/navigation_keys.dart';
import 'package:app/features/home/presentation/screens/home_page.dart';
import 'package:app/features/open-mitra/presentation/screens/open_mitra_page.dart';
import 'package:app/features/contracts/presentation/screens/contracts_page.dart';
import 'package:app/features/contracts/presentation/screens/contract_detail_page.dart';
import 'package:app/features/profit/presentation/screens/profit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class Routes {
  static const home = "/home";
  static const openMitra = "/open-mitra";
  static const contracts = "/contracts";
  static const contractDetail = "/contracts/:id";
  static const profit = "/profit";
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: Routes.home,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.openMitra,
        builder: (context, state) => const OpenMitraPage(),
      ),
      GoRoute(
        path: Routes.contracts,
        builder: (context, state) => const ContractsPage(),
        routes: [
          GoRoute(
            path: ":id",
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return ContractDetailPage(contractId: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: Routes.profit,
        builder: (context, state) => const ProfitPage(),
      ),
    ],
  );
}