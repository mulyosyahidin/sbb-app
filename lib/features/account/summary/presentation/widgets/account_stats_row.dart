import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AccountStatsRow extends StatelessWidget {
  const AccountStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildStatCard('3', 'Kontrak')),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('5', 'Mitra')),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('Rp45jt', 'Profit', valueColor: AppColors.primary)),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, {Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
              color: valueColor ?? AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.label(color: AppColors.textSecondaryLight, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
