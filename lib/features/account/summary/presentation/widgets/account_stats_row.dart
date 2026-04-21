import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/partner/application/partner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountStatsRow extends ConsumerWidget {
  const AccountStatsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final partner = ref.watch(partnerControllerProvider).value;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildStatCard(context, '3', 'Kontrak')),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard(context, '2', 'Sapi')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            if (partner?.level == 'partner_consultant') ...[
              Expanded(child: _buildStatCard(context, '5', 'Mitra')),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: _buildStatCard(
                context,
                'Rp45jt',
                'Profit',
                valueColor: colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label,
      {Color? valueColor}) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: colorScheme.outline.withValues(alpha: isDark ? 0.3 : 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.1 : 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.title(
              fontWeight: FontWeight.bold,
              color: valueColor ?? colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.label(
                color: colorScheme.onSurfaceVariant, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
