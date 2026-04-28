import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/app/app_router.dart';
import 'package:flutter/services.dart';

class BankAccountDetailBottomSheet extends ConsumerWidget {
  final BankAccount account;

  const BankAccountDetailBottomSheet({
    super.key,
    required this.account,
  });

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    bool isDeleting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Hapus Rekening'),
          content: const Text(
              'Apakah Anda yakin ingin menghapus rekening ini? Tindakan ini tidak dapat dibatalkan.'),
          actions: [
            TextButton(
              onPressed: isDeleting ? null : () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: isDeleting
                  ? null
                  : () async {
                      setState(() => isDeleting = true);

                      try {
                        await ref
                            .read(bankAccountsControllerProvider.notifier)
                            .deleteAccount(account.id);

                        if (context.mounted) {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(context); // Close bottom sheet
                          ToastUtil.showSuccess(
                            context,
                            title: 'Berhasil',
                            description: 'Rekening berhasil dihapus',
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          setState(() => isDeleting = false);
                          ToastUtil.showError(
                            context,
                            title: 'Gagal',
                            description: e.toString(),
                          );
                        }
                      }
                    },
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              child: Text(isDeleting ? 'Menghapus...' : 'Hapus'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: account.isPrimary
                      ? colorScheme.primaryContainer.withValues(alpha: 0.8)
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.account_balance,
                  color: account.isPrimary
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.bankName,
                      style: AppTextStyles.title(fontSize: 18),
                    ),
                    if (account.isPrimary)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Utama',
                          style: AppTextStyles.label(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          _buildDetailItem(context, 'Nama Pemilik', account.accountName),
          _buildDetailItem(context, 'Nomor Rekening', account.accountNumber,
              isCopyable: true),
          if (account.note != null && account.note!.isNotEmpty)
            _buildDetailItem(context, 'Catatan', account.note!),

          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    context.push(Routes.bankAccountEdit, extra: account);
                  },
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  label: const Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  label: 'Hapus',
                  onPressed: account.isPrimary
                      ? null
                      : () => _showDeleteConfirmation(context, ref),
                  backgroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value,
      {bool isCopyable = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.label(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: AppTextStyles.body(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (isCopyable)
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: value),
                    );
                    ToastUtil.showSuccess(
                      context,
                      title: 'Disalin',
                      description: '$label telah disalin ke papan klip',
                    );
                  },
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: colorScheme.primary,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
