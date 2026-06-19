import 'package:app/features/home_guest/presentation/widgets/home_slider.dart';
import 'package:app/features/home_guest/presentation/widgets/home_guest_cta.dart';
import 'package:app/features/home_guest/presentation/widgets/home_guest_header.dart';
import 'package:app/features/home_guest/presentation/widgets/home_menu_grid.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeGuestPage extends StatelessWidget {
  const HomeGuestPage({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _gold = Color(0xFFD3AB35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeGuestHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const HomeSlider(),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Menu Utama'),
                  const SizedBox(height: 16),
                  const HomeMenuGrid(),
                  const SizedBox(height: 28),
                  _buildSectionTitle(context, 'Kenapa SBB'),
                  const SizedBox(height: 14),
                  const _GuestValueCards(),
                  const SizedBox(height: 28),
                  const HomeGuestCTA(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: _gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.body(
            color: _green,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}

class _GuestValueCards extends StatelessWidget {
  const _GuestValueCards();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _GuestValueCard(
            icon: Icons.verified_user_outlined,
            title: 'Transparan',
            subtitle: 'Pantau kontrak dan laporan profit dengan jelas.',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _GuestValueCard(
            icon: Icons.insights_outlined,
            title: 'Terukur',
            subtitle: 'Program dibuat dengan durasi dan skema yang rapi.',
          ),
        ),
      ],
    );
  }
}

class _GuestValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _GuestValueCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 156),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: HomeGuestPage._green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: HomeGuestPage._green, size: 21),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
