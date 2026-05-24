import 'package:app/app/app_router.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountMenuList extends ConsumerWidget {
  const AccountMenuList({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authSessionControllerProvider);
    final isLoggingOut = authState.isLoading;

    return Column(
      children: [
        _buildMenuItem(
          context,
          Icons.person,
          'Edit Profil',
          onTap: () => context.push(Routes.editProfile),
        ),
        _buildMenuItem(
          context,
          Icons.security,
          'Password',
          onTap: () => context.push(Routes.editPassword),
        ),
        _buildMenuItem(
          context,
          Icons.account_balance,
          'Rekening Bank',
          onTap: () => context.push(Routes.bankAccounts),
        ),
        _buildMenuItem(
          context,
          Icons.notifications,
          'Notifikasi',
        ),
        _buildMenuItem(
          context,
          Icons.description,
          'Dokumen & Kontrak',
        ),
        _buildMenuItem(
          context,
          Icons.logout,
          'Keluar',
          isLast: true,
          isLoading: isLoggingOut,
          onTap:
              isLoggingOut ? null : () => _showLogoutConfirmation(context, ref),
        ),
      ],
    );
  }

  void _showLogoutConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar dari akun ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: AppTextStyles.body(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authSessionControllerProvider.notifier).logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            child: const Text('Ya, Keluar'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLast = false,
    bool isLoading = false,
    VoidCallback? onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final itemColor = isLast ? Colors.red : _green;
    final itemBackground = isLast ? const Color(0xFFFFF0F0) : _softGreen;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: itemBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: itemColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.w600,
                    color: isLast ? Colors.red : colorScheme.onSurface,
                  ),
                ),
              ),
              if (isLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.red,
                  ),
                )
              else
                Icon(
                  Icons.chevron_right,
                  color: isLast
                      ? Colors.red.withValues(alpha: 0.4)
                      : _gold.withValues(alpha: 0.8),
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
