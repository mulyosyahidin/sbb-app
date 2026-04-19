import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/features/account/bank_accounts/presentation/widgets/bank_account_detail_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BankAccountCard extends StatelessWidget {
  final BankAccount account;
  final bool isProcessing;
  final VoidCallback? onSetPrimary;

  const BankAccountCard({
    super.key,
    required this.account,
    this.isProcessing = false,
    this.onSetPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => BankAccountDetailBottomSheet(account: account),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: account.isPrimary
                ? colorScheme.primary.withValues(alpha: 0.8)
                : colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.3),
            width: account.isPrimary ? 1.5 : 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Accent bar — hanya muncul saat primary
              if (account.isPrimary)
                Container(
                  height: 3,
                  color: colorScheme.primary,
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                child: Row(
                  children: [
                    // Bank icon
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: account.isPrimary
                            ? colorScheme.primaryContainer.withValues(alpha: 0.8)
                            : colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.account_balance,
                        color: account.isPrimary
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Bank info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            account.bankName,
                            style: AppTextStyles.body(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            account.accountName,
                            style: AppTextStyles.body(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Primary badge
                    if (account.isPrimary)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded,
                                size: 11, color: colorScheme.onPrimaryContainer),
                            const SizedBox(width: 4),
                            Text(
                              'Utama',
                              style: AppTextStyles.label(
                                color: colorScheme.onPrimaryContainer,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              // Divider + bottom row
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      color: colorScheme.outline.withValues(alpha: 0.15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Rekening',
                              style: AppTextStyles.label(
                                color: colorScheme.onSurfaceVariant
                                    .withValues(alpha: 0.6),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              account.accountNumber,
                              style: AppTextStyles.body(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: colorScheme.onSurface,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        if (!account.isPrimary)
                          OutlinedButton(
                            onPressed: isProcessing ? null : onSetPrimary,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: colorScheme.primary,
                              side: BorderSide(
                                color: colorScheme.primary.withValues(alpha: 0.4),
                                width: 0.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            child: Text(isProcessing ? '......' : 'Jadikan utama'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}