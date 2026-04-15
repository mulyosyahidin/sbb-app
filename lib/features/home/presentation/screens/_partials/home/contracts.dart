import 'package:app/features/home/presentation/widgets/contract_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';

class ContractPartial extends StatelessWidget {
  const ContractPartial({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daftar Kontrak',
                style: AppTextStyles.title(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 0),
              ),
              Text(
                'Lihat Semua',
                style: AppTextStyles.body(
                        color: AppColors.primary, fontWeight: FontWeight.w600)
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ContractItemWidget(
            title: 'KTR-202604-001',
            date: '12 Apr 2026',
            amount: 'Rp 15.000.000',
            amountColor: colorScheme.onSurface,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary.withValues(alpha: 0.08),
            icon: Icons.description,
          ),
          const SizedBox(height: 12),
          ContractItemWidget(
            title: 'KTR-202604-002',
            date: '10 Apr 2026',
            amount: 'Rp 50.000.000',
            amountColor: colorScheme.onSurface,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary.withValues(alpha: 0.08),
            icon: Icons.description,
          ),
        ],
      ),
    );
  }
}
