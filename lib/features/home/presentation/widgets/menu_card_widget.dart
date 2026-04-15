import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';

class MenuCardWidget extends StatelessWidget {
  final Map<String, dynamic> menu;

  const MenuCardWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(menu['icon'] as IconData,
              color: AppColors.primary, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          menu['label'] as String,
          textAlign: TextAlign.center,
          style: AppTextStyles.label(
                  color: colorScheme.onSurface,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal)
              .copyWith(fontSize: 10, height: 1.2),
        ),
      ],
    );
  }
}

