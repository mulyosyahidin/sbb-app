import 'package:app/core/auth/domain/entities/auth_driver.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/edit_profile/application/edit_profile_controller.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({super.key});

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    // Initial check in case data is already available
    final user = ref.read(authSessionControllerProvider).value?.user;
    if (user != null) {
      _nameController.text = user.name;
      _emailController.text = user.email;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _fieldErrors = {});

    // Basic validation
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Nama dan Email wajib diisi',
      );
      return;
    }

    ref.read(editProfileControllerProvider.notifier).updateProfile(
          name: _nameController.text,
          email: _emailController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(authSessionControllerProvider);

    // Listen for session data to populate controllers if they were empty
    ref.listen(authSessionControllerProvider, (previous, next) {
      if (next.hasValue && _nameController.text.isEmpty) {
        final user = next.value?.user;
        if (user != null) {
          _nameController.text = user.name;
          _emailController.text = user.email;
        }
      }
    });

    return sessionState.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Center(
        child: Text('Gagal memuat data: $error'),
      ),
      data: (session) {
        final user = session.user;
        if (user == null) {
          return const Center(
            child: Text('Data pengguna tidak ditemukan'),
          );
        }

        final isEmailEditable = user.driver == AuthDriver.email;
        final isGoogleUser = user.driver == AuthDriver.google;

        ref.listen(editProfileControllerProvider, (previous, next) {
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
            } else {
              ToastUtil.showError(
                context,
                title: 'Terjadi kesalahan',
                description: error.toString(),
              );
            }
          } else if (next is AsyncData &&
              !next.isLoading &&
              previous is AsyncLoading) {
            ToastUtil.showSuccess(
              context,
              title: 'Berhasil',
              description: 'Profil berhasil diperbarui',
            );
          }
        });

        final profileState = ref.watch(editProfileControllerProvider);
        final isLoading = profileState is AsyncLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: _nameController,
              label: 'NAMA LENGKAP',
              hint: 'Masukkan nama lengkap',
              keyboardType: TextInputType.name,
              errorText: _fieldErrors['name'],
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _emailController,
              label: 'EMAIL',
              hint: 'Masukkan email',
              keyboardType: TextInputType.emailAddress,
              errorText: _fieldErrors['email'],
              enabled: isEmailEditable,
              suffixIcon: isGoogleUser
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 20,
                        height: 20,
                      ),
                    )
                  : null,
            ),
            if (user.emailVerifiedAt == null && isEmailEditable) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.orange, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Email Anda belum terverifikasi. Silakan cek kotak masuk email Anda.',
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 32),
            if (user.emailVerifiedAt == null && isEmailEditable) ...[
              OutlinedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        final success = await ref
                            .read(editProfileControllerProvider.notifier)
                            .resendVerification();
                        if (success && context.mounted) {
                          ToastUtil.showSuccess(
                            context,
                            title: 'Berhasil',
                            description: 'Email verifikasi telah dikirim ulang',
                          );
                        }
                      },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Kirim Ulang Email Verifikasi'),
              ),
              const SizedBox(height: 12),
            ],
            PrimaryButton(
              label: 'Simpan',
              isLoading: isLoading,
              onPressed: isLoading ? null : _handleSubmit,
            ),

          ],
        );
      },
    );
  }
}
