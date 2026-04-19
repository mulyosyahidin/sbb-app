import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';

class HomeRecentActivities extends StatelessWidget {
  const HomeRecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActivityCard(
          icon: Icons.cruelty_free,
          iconColor: AppColors.primary,
          title: 'Sapi #SBB-014 sehat',
          subtitle: 'Laporan kesehatan masuk',
          trailingTitle: 'Aktif',
          trailingTitleColor: AppColors.primary,
          trailingSubtitle: 'Hari ini',
        ),
        const SizedBox(height: 12),
        _buildActivityCard(
          icon: Icons.payments_outlined,
          iconColor: Colors.orange,
          title: 'Profit dicairkan',
          subtitle: 'Kontrak periode Maret',
          trailingTitle: '+Rp 3,2jt',
          trailingTitleColor: AppColors.primary,
          trailingSubtitle: '2 hari lalu',
        ),
        const SizedBox(height: 12),
        _buildActivityCard(
          icon: Icons.assignment_outlined,
          iconColor: Colors.blue,
          title: 'Kontrak baru ditanda',
          subtitle: 'SBB-K-2026-041',
          trailingTitle: 'Proses',
          trailingTitleColor: Colors.blue,
          trailingSubtitle: '5 hari lalu',
        ),
      ],
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String trailingTitle,
    required Color trailingTitleColor,
    required String trailingSubtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.body(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimaryLight)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: AppTextStyles.label(
                        color: AppColors.textSecondaryLight,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(trailingTitle,
                  style: AppTextStyles.body(
                      fontWeight: FontWeight.bold, color: trailingTitleColor)),
              const SizedBox(height: 4),
              Text(trailingSubtitle,
                  style: AppTextStyles.label(
                      color: AppColors.textSecondaryLight,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0)),
            ],
          ),
        ],
      ),
    );
  }
}
