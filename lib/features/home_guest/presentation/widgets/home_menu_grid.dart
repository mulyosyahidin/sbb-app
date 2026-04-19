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
        'title': 'Kontrak',
        'icon': Icons.assignment_outlined,
        'color': Colors.blue
      },
      {'title': 'Profit', 'icon': Icons.bar_chart, 'color': Colors.green},
      {'title': 'Galeri', 'icon': Icons.photo_outlined, 'color': Colors.orange},
      {
        'title': 'Reward',
        'icon': Icons.emoji_events_outlined,
        'color': Colors.amber
      },
      {
        'title': 'Open Mitra',
        'icon': Icons.group_outlined,
        'color': Colors.purple
      },
      {
        'title': 'Jadwal',
        'icon': Icons.calendar_month_outlined,
        'color': Colors.indigo
      },
      {
        'title': 'Laporan',
        'icon': Icons.description_outlined,
        'color': Colors.teal
      },
      {'title': 'Lainnya', 'icon': Icons.settings_outlined, 'color': Colors.grey},
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
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final menu = menus[index];
        return GestureDetector(
          onTap: () => context.push(Routes.login),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (menu['color'] as Color).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(menu['icon'] as IconData,
                    color: menu['color'] as Color, size: 26),
              ),
              const SizedBox(height: 8),
              Text(
                menu['title'] as String,
                style: AppTextStyles.body(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      },
    );
  }
}
