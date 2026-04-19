import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';

class HomeStatsGrid extends StatelessWidget {
  const HomeStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildStatCard(
                    context, 'TOTAL PROFIT', 'Rp 45jt', true, Icons.show_chart,
                    isPrimary: true)),
            const SizedBox(width: 12),
            Expanded(
                child: _buildStatCard(context, 'KONTRAK AKTIF', '3 Unit', false,
                    Icons.description_outlined)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
                child: _buildStatCard(
                    context, 'TOTAL SAPI', '2 Ekor', false, Icons.pets)),
            const SizedBox(width: 12),
            Expanded(
                child: _buildStatCard(context, 'MITRA SAYA', '5 Orang', false,
                    Icons.people_outline)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value,
      bool isTrend, IconData icon,
      {bool isPrimary = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary
            ? colorScheme.primary
            : (Theme.of(context).brightness == Brightness.dark
                ? AppColors.surfaceDark
                : AppColors.surfaceLight),
        border: isPrimary ? null : Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isPrimary
                  ? Colors.white.withValues(alpha: 0.2)
                  : colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon,
                color: isPrimary ? Colors.white : colorScheme.primary,
                size: 20),
          ),
          const SizedBox(height: 12),
          Text(title,
              style: AppTextStyles.label(
                  color:
                      isPrimary ? Colors.white70 : colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(value,
              style: AppTextStyles.title(
                  color: isPrimary ? Colors.white : colorScheme.onSurface,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
