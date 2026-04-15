import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';

class SecondaryBalanceCard extends StatelessWidget {
  const SecondaryBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.show_chart,
                color: AppColors.primary, size: 20),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Keuntungan',
            style: AppTextStyles.label(
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal)
                .copyWith(fontSize: 12),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              'Rp 12.500.000',
              style: AppTextStyles.title(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 0),
            ),
          ),
        ],
      ),
    );
  }
}
