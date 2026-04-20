import 'package:app/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.85,
      children: [
        _buildMenuItem(
          context,
          title: 'Open Mitra',
          icon: Icons.group_outlined,
          color: Colors.purple,
          route: Routes.partner,
        ),
        _buildMenuItem(
          context,
          title: 'Company',
          icon: Icons.business_outlined,
          color: Colors.green,
          route: Routes.companyProfile,
        ),
        _buildMenuItem(
          context,
          title: 'Profit',
          icon: Icons.bar_chart,
          color: Colors.green,
          route: Routes.profit,
        ),
        _buildMenuItem(
          context,
          title: 'Reward',
          icon: Icons.emoji_events_outlined,
          color: Colors.amber,
          route: Routes.reward,
        ),
        _buildMenuItem(
          context,
          title: 'Kalkulator',
          icon: Icons.calculate_outlined,
          color: Colors.amber,
          route: Routes.calculator,
        ),
        _buildMenuItem(
          context,
          title: 'Galeri',
          icon: Icons.photo_outlined,
          color: Colors.orange,
          route: Routes.gallery,
        ),
        _buildMenuItem(
          context,
          title: 'Kontrak',
          icon: Icons.assignment_outlined,
          color: Colors.blue,
          route: Routes.contract,
        ),
        _buildMenuItem(
          context,
          title: 'Lainnya',
          icon: Icons.settings_outlined,
          color: Colors.grey,
          route: null,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String? route,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: route != null
          ? () {
              if (route == Routes.profit ||
                  route == Routes.contract ||
                  route == Routes.home ||
                  route == Routes.account) {
                context.go(route);
              } else {
                context.push(route);
              }
            }
          : null,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.1)),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const Spacer(),
          Text(
            title,
            style: AppTextStyles.body(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
