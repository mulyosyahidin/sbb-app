import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/home/presentation/widgets/banner_carousel.dart';
import 'package:app/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:app/features/home/presentation/widgets/home_contract_list.dart';
import 'package:app/features/home/presentation/widgets/home_header.dart';
import 'package:app/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:app/features/home/presentation/widgets/quick_stats.dart';
import 'package:app/features/home/presentation/widgets/user_greeting.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        bottomNavigationBar: HomeBottomNav(isDark: isDark),
        body: Stack(
          children: [
            // Playful background with multiple gradient layers
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 320,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryLight,
                      theme.scaffoldBackgroundColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
            // Decorative circles
            Positioned(
              top: -50,
              right: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryLight.withValues(alpha: 0.2),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: -40,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeHeader(),
                          const SizedBox(height: 20),
                          const UserGreeting(),
                          const SizedBox(height: 20),
                          const BannerCarousel(),
                          const SizedBox(height: 28),
                          const QuickStats(),
                          const SizedBox(height: 28),
                          Text(
                            'Menu',
                            style: AppTextStyles.title(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const HomeMenuGrid(),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 20.0, bottom: 12.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kontrak Aktif',
                            style: AppTextStyles.title(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Lihat Semua',
                              style: AppTextStyles.body(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: HomeContractList(),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
