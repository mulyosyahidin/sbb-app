import 'package:app/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        'title': 'Open Mitra',
        'subtitle': 'Gabung',
        'icon': Icons.group_outlined,
        'color': const Color(0xFF7C3AED)
      },
      {
        'title': 'Company',
        'subtitle': 'Profil',
        'icon': Icons.business_outlined,
        'color': const Color(0xFF1F6E2D)
      },
      {
        'title': 'Profit',
        'subtitle': 'Bagi hasil',
        'icon': Icons.bar_chart,
        'color': const Color(0xFF16A34A)
      },
      {
        'title': 'Reward',
        'subtitle': 'Hadiah',
        'icon': Icons.emoji_events_outlined,
        'color': const Color(0xFFD3AB35)
      },
      {
        'title': 'Kalkulator',
        'subtitle': 'Simulasi',
        'icon': Icons.calculate_outlined,
        'color': const Color(0xFFF59E0B)
      },
      {
        'title': 'Galeri',
        'subtitle': 'Dokumentasi',
        'icon': Icons.photo_outlined,
        'color': const Color(0xFFE67E22)
      },
      {
        'title': 'Kontrak',
        'subtitle': 'Program',
        'icon': Icons.assignment_outlined,
        'color': const Color(0xFF2563EB)
      },
      {
        'title': 'Lainnya',
        'subtitle': 'Masuk',
        'icon': Icons.more_horiz_rounded,
        'color': const Color(0xFF64748B)
      },
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
      itemBuilder: (context, index) {
        final menu = menus[index];
        return GestureDetector(
          onTap: () => context.push(Routes.login),
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
                    color: (menu['color'] as Color).withValues(alpha: 0.11),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    menu['icon'] as IconData,
                    color: menu['color'] as Color,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menu['title'] as String,
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
                        menu['subtitle'] as String,
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
      },
    );
  }
}
