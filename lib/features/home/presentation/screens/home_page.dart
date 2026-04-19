import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/home/presentation/widgets/home_banner.dart';
import 'package:app/features/home/presentation/widgets/home_header.dart';
import 'package:app/features/home/presentation/widgets/home_stats_grid.dart';
import 'package:app/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:app/features/home/presentation/widgets/home_recent_activities.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
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
                  const SizedBox(height: 20),
                  const HomeStatsGrid(),
                  const SizedBox(height: 24),
                  Text('Menu Utama',
                      style: AppTextStyles.title(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryLight)),
                  const SizedBox(height: 16),
                  const HomeMenuGrid(),
                  const SizedBox(height: 24),
                  Text('Aktivitas Terbaru',
                      style: AppTextStyles.title(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryLight)),
                  const SizedBox(height: 16),
                  const HomeRecentActivities(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderLight)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryLight,
        selectedLabelStyle:
            AppTextStyles.label(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        unselectedLabelStyle:
            AppTextStyles.label(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        currentIndex: 0,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'Kontrak'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Profit'),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_outlined), label: 'Galeri'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
    );
  }
}
