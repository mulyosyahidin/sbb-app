import 'package:app/app/app_router.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountMenuList extends ConsumerWidget {
  const AccountMenuList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authSessionControllerProvider);
    final isLoggingOut = authState.isLoading;

    return Column(
      children: [
        _buildMenuItem(
          Icons.person,
          'Edit Profil',
          const Color(0xFFF0F7F4),
          const Color(0xFF468432),
          onTap: () => context.push(Routes.editProfile),
        ),
        _buildMenuItem(
          Icons.security,
          'Password',
          const Color(0xFFF4F0F7),
          const Color(0xFF5B3284),
          onTap: () => context.push(Routes.editPassword),
        ),
        _buildMenuItem(Icons.account_balance, 'Rekening Bank', const Color(0xFFF0F4F7), const Color(0xFF325B84)),
        _buildMenuItem(Icons.notifications, 'Notifikasi', const Color(0xFFFFF8F0), const Color(0xFF846432)),
        _buildMenuItem(Icons.description, 'Dokumen & Kontrak', const Color(0xFFF7F0F0), const Color(0xFF843232)),
        _buildMenuItem(
          Icons.logout,
          'Keluar',
          const Color(0xFFFFF0F0),
          Colors.red,
          isLast: true,
          isLoading: isLoggingOut,
          onTap: isLoggingOut ? null : () => _showLogoutConfirmation(context, ref),
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
            child: Text('Batal', style: AppTextStyles.body(color: AppColors.textSecondaryLight)),
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
    IconData icon,
    String title,
    Color bgColor,
    Color iconColor, {
    bool isLast = false,
    bool isLoading = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.5)),
      ),
      child: ListTile(
        onTap: isLoading ? null : onTap,
        enabled: !isLoading,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          title,
          style: AppTextStyles.body(
            fontWeight: FontWeight.w600,
            color: isLast ? Colors.red : AppColors.textPrimaryLight,
          ),
        ),
        trailing: isLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red),
              )
            : Icon(
                Icons.chevron_right,
                color: isLast ? Colors.red.withValues(alpha: 0.4) : AppColors.textSecondaryLight.withValues(alpha: 0.4),
                size: 16,
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
