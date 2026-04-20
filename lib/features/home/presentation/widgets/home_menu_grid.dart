import 'package:app/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final menus = [
      {
        'title': 'Kontrak',
        'icon': Icons.assignment_outlined,
        'color': Colors.blue,
        'route': Routes.contract,
      },
      {
        'title': 'Profit',
        'icon': Icons.bar_chart,
        'color': Colors.green,
        'route': Routes.profit,
      },
      {
        'title': 'Galeri',
        'icon': Icons.photo_outlined,
        'color': Colors.orange,
        'route': Routes.gallery,
      },
      {
        'title': 'Reward',
        'icon': Icons.emoji_events_outlined,
        'color': Colors.amber,
        'route': null,
      },
      {
        'title': 'Open Mitra',
        'icon': Icons.group_outlined,
        'color': Colors.purple,
        'route': Routes.openPartner,
      },
      {
        'title': 'Jadwal',
        'icon': Icons.calendar_month_outlined,
        'color': Colors.indigo,
        'route': null,
      },
      {
        'title': 'Laporan',
        'icon': Icons.description_outlined,
        'color': Colors.teal,
        'route': null,
      },
      {
        'title': 'Lainnya',
        'icon': Icons.settings_outlined,
        'color': Colors.grey,
        'route': null,
      },
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menus.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final menu = menus[index];
        final route = menu['route'] as String?;

        return InkWell(
          onTap: route != null ? () => context.go(route) : null,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (menu['color'] as Color).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: (menu['color'] as Color).withValues(alpha: 0.1)),
                ),
                child: Icon(menu['icon'] as IconData,
                    color: menu['color'] as Color, size: 24),
              ),
              const Spacer(),
              Text(
                menu['title'] as String,
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
      },
    );
  }
}
