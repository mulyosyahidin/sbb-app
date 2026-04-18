import 'package:flutter/material.dart';
import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class HomeMenuGrid extends StatelessWidget {
  const HomeMenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        'icon': Icons.people_alt_rounded,
        'label': 'Open Mitra',
        'color': const Color(0xFFFF6B9D),
        'bg': const Color(0xFFFFE5ED),
        'route': Routes.openMitra,
      },
      {
        'icon': Icons.edit_document,
        'label': 'Kontrak',
        'color': const Color(0xFF00BCD4),
        'bg': const Color(0xFFE0F7FA),
        'route': Routes.contracts,
      },
      {
        'icon': Icons.trending_up_rounded,
        'label': 'Profit',
        'color': const Color(0xFF4CAF50),
        'bg': const Color(0xFFE8F5E9),
        'route': Routes.profit,
      },
      {
        'icon': Icons.emoji_events_rounded,
        'label': 'Reward',
        'color': const Color(0xFFFFB300),
        'bg': const Color(0xFFFFF8E1),
        'route': null,
      },
      {
        'icon': Icons.business_rounded,
        'label': 'Profil',
        'color': const Color(0xFF9C27B0),
        'bg': const Color(0xFFF3E5F5),
        'route': null,
      },
      {
        'icon': Icons.calculate_rounded,
        'label': 'Kalkulator',
        'color': const Color(0xFFFF5722),
        'bg': const Color(0xFFFFE5E0),
        'route': null,
      },
      {
        'icon': Icons.photo_library_rounded,
        'label': 'Gallery',
        'color': const Color(0xFF3F51B5),
        'bg': const Color(0xFFE8EAF6),
        'route': null,
      },
      {
        'icon': Icons.apps_rounded,
        'label': 'All Menu',
        'color': const Color(0xFF607D8B),
        'bg': const Color(0xFFECEFF1),
        'route': null,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final menu = menus[index];
        return InkWell(
          onTap: () {
            if (menu['route'] != null) {
              context.push(menu['route'] as String);
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: HomeMenuCard(menu: menu),
        );
      },
    );
  }
}

class HomeMenuCard extends StatelessWidget {
  final Map<String, dynamic> menu;
  const HomeMenuCard({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: menu['bg'] as Color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: (menu['color'] as Color).withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            menu['icon'] as IconData,
            color: menu['color'] as Color,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          menu['label'] as String,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.label(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ).copyWith(height: 1.2),
        ),
      ],
    );
  }
}
