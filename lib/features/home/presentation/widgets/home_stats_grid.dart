import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
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
                child: _buildStatCard('TOTAL PROFIT', 'Rp 45jt', true,
                    Icons.show_chart, isPrimary: true)),
            const SizedBox(width: 12),
            Expanded(
                child: _buildStatCard(
                    'KONTRAK AKTIF', '3 Unit', false, Icons.description_outlined)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
                child: _buildStatCard('TOTAL SAPI', '2 Ekor', false, Icons.pets)),
            const SizedBox(width: 12),
            Expanded(
                child: _buildStatCard(
                    'MITRA SAYA', '5 Orang', false, Icons.people_outline)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, bool isTrend, IconData icon,
      {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : Colors.white,
        border: isPrimary ? null : Border.all(color: AppColors.borderLight),
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
                  : AppColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon,
                color: isPrimary ? Colors.white : AppColors.primary, size: 20),
          ),
          const SizedBox(height: 12),
          Text(title,
              style: AppTextStyles.label(
                  color: isPrimary ? Colors.white70 : AppColors.textSecondaryLight,
                  letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(value,
              style: AppTextStyles.title(
                  color: isPrimary ? Colors.white : AppColors.textPrimaryLight,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
