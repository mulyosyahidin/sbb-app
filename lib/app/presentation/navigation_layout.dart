import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.borderLight)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondaryLight,
          selectedLabelStyle: AppTextStyles.label(
              fontWeight: FontWeight.bold, letterSpacing: 0.5),
          unselectedLabelStyle: AppTextStyles.label(
              fontWeight: FontWeight.w600, letterSpacing: 0.5),
          currentIndex: navigationShell.currentIndex,
          onTap: _onTap,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              activeIcon: Icon(Icons.description),
              label: 'Kontrak',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: 'Profit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_outlined),
              activeIcon: Icon(Icons.photo),
              label: 'Galeri',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
