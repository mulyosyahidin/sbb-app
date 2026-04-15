import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ContractItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final Color amountColor;
  final Color iconColor;
  final Color iconBgColor;
  final IconData icon;

  const ContractItemWidget({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.amountColor,
    required this.iconColor,
    required this.iconBgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600)
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppTextStyles.label(
                          color: colorScheme.onSurfaceVariant,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal)
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyles.body(
                    color: amountColor, fontWeight: FontWeight.w600)
                .copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
