import 'package:app/core/auth/domain/entities/auth_driver.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/edit_password/application/edit_password_controller.dart';
import 'package:app/shared/forms/app_text_password.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditPasswordPage extends ConsumerStatefulWidget {
  const EditPasswordPage({super.key});

  @override
  ConsumerState<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends ConsumerState<EditPasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Map<String, String> _fieldErrors = {};
  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() => _fieldErrors = {});

    if (_currentPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Semua field wajib diisi',
      );
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _fieldErrors = {
          'new_password_confirmation': 'Konfirmasi password tidak cocok',
        };
      });
      return;
    }

    await ref.read(editPasswordControllerProvider.notifier).updatePassword(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
          newPasswordConfirmation: _confirmPasswordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authSessionControllerProvider).value?.user;
    final isEmailUser = user?.driver == AuthDriver.email;

    ref.listen(editPasswordControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is ValidationFailure) {
          setState(() {
            _fieldErrors = error.errors ?? {};
          });
          ToastUtil.showError(
            context,
            title: 'Terjadi kesalahan',
            description: error.message,
          );
        } else if (error is Failure) {
          ToastUtil.showError(
            context,
            title: 'Gagal',
            description: error.message,
          );
        }
      } else if (next is AsyncData &&
          !next.isLoading &&
          previous is AsyncLoading) {
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: 'Password berhasil diperbarui',
        );
        context.pop();
      }
    });

    final isLoading = ref.watch(editPasswordControllerProvider).isLoading;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Ganti Password',
              subtitle: 'Gunakan password akun Anda',
            ),
            Expanded(
              child: !isEmailUser
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _buildWhiteCard(
                          context: context,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? _green.withValues(alpha: 0.15)
                                      : _softGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.security_update_warning_outlined,
                                  size: 56,
                                  color: _green,
                                ),
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Fitur Tidak Tersedia',
                                style: AppTextStyles.heading(
                                  color: _green,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Anda masuk menggunakan akun ${user?.driver.value.toUpperCase()}. Password hanya dapat diubah melalui penyedia layanan tersebut atau jika Anda mendaftar menggunakan Email.',
                                style: AppTextStyles.body(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                      child: _buildWhiteCard(
                        context: context,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionTitle(context, 'PASSWORD AKUN'),
                            const SizedBox(height: 16),
                            AppTextPassword(
                              controller: _currentPasswordController,
                              label: 'PASSWORD SAAT INI',
                              hint: 'Masukkan password lama',
                              errorText: _fieldErrors['current_password'],
                            ),
                            const SizedBox(height: 20),
                            AppTextPassword(
                              controller: _newPasswordController,
                              label: 'PASSWORD BARU',
                              hint: 'Masukkan password baru',
                              errorText: _fieldErrors['new_password'],
                            ),
                            const SizedBox(height: 20),
                            AppTextPassword(
                              controller: _confirmPasswordController,
                              label: 'KONFIRMASI PASSWORD BARU',
                              hint: 'Ulangi password baru',
                              errorText:
                                  _fieldErrors['new_password_confirmation'],
                            ),
                            const SizedBox(height: 32),
                            PrimaryButton(
                              label: 'Simpan Password',
                              isLoading: isLoading,
                              onPressed: isLoading ? null : _handleSubmit,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhiteCard({required BuildContext context, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: _gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.body(
            color: _green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
