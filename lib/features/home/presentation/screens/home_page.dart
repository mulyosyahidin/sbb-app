import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/home/presentation/widgets/home_banner.dart';
import 'package:app/features/home/presentation/widgets/home_header.dart';
import 'package:app/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:app/features/home/presentation/widgets/home_recent_activities.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const HomeBanner(),
                  const SizedBox(height: 24),
                  Text('Menu Utama',
                      style: AppTextStyles.title(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface)),
                  const SizedBox(height: 16),
                  const HomeMenuGrid(),
                  const SizedBox(height: 24),
                  Text('Aktivitas Terbaru',
                      style: AppTextStyles.title(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface)),
                  const SizedBox(height: 16),
                  const HomeRecentActivities(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
