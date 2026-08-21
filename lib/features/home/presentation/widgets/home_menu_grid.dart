import 'package:app/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      _HomeMenuItem(
        title: 'Open Mitra',
        subtitle: 'Gabung',
        icon: Icons.group_outlined,
        color: const Color(0xFF7C3AED),
        route: Routes.partner,
      ),
      _HomeMenuItem(
        title: 'Company',
        subtitle: 'Profil',
        icon: Icons.business_outlined,
        color: const Color(0xFF1F6E2D),
        route: Routes.companyProfile,
      ),
      _HomeMenuItem(
        title: 'Profit',
        subtitle: 'Bagi hasil',
        icon: Icons.bar_chart,
        color: const Color(0xFF16A34A),
        route: Routes.profit,
      ),
      _HomeMenuItem(
        title: 'Reward',
        subtitle: 'Hadiah',
        icon: Icons.emoji_events_outlined,
        color: const Color(0xFFD3AB35),
        route: Routes.reward,
      ),
      _HomeMenuItem(
        title: 'Kalkulator',
        subtitle: 'Simulasi',
        icon: Icons.calculate_outlined,
        color: const Color(0xFFF59E0B),
        route: Routes.calculator,
      ),
      _HomeMenuItem(
        title: 'Galeri',
        subtitle: 'Dokumentasi',
        icon: Icons.photo_outlined,
        color: const Color(0xFFE67E22),
        route: Routes.gallery,
      ),
      _HomeMenuItem(
        title: 'Kontrak',
        subtitle: 'Program',
        icon: Icons.assignment_outlined,
        color: const Color(0xFF2563EB),
        route: Routes.contract,
      ),
      const _HomeMenuItem(
        title: 'Lainnya',
        subtitle: 'Menu',
        icon: Icons.more_horiz_rounded,
        color: Color(0xFF64748B),
        route: null,
      ),
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menus.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.45,
      ),
      itemBuilder: (context, index) => _buildMenuItem(context, menus[index]),
    );
  }

  Widget _buildMenuItem(BuildContext context, _HomeMenuItem item) {
    return InkWell(
      onTap: item.route != null
          ? () {
              if (item.route == Routes.profit ||
                  item.route == Routes.contract ||
                  item.route == Routes.home ||
                  item.route == Routes.account) {
                context.go(item.route!);
              } else {
                context.push(item.route!);
              }
            }
          : null,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
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
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.11),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(item.icon, color: item.color, size: 22),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.body(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: 0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    style: AppTextStyles.body(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeMenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? route;

  const _HomeMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });
}
