import 'package:app/app/app_router.dart';
import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/auth/register/application/register_controller.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_text_password.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  Map<String, String> _fieldErrors = {};
  bool _isRedirecting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    setState(() => _fieldErrors = {});

    // Basic validation
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Nama, Email, dan Password wajib diisi',
      );
      return;
    }

    if (_passwordController.text != _passwordConfirmController.text) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Konfirmasi password tidak cocok',
      );
      return;
    }

    ref.read(registerControllerProvider.notifier).register(
          name: _nameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          password: _passwordController.text,
          passwordConfirmation: _passwordConfirmController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is ApiException && error.errors != null) {
          setState(() {
            _fieldErrors = error.errors!;
          });
        } else {
          ToastUtil.showError(
            context,
            title: 'Gagal Mendaftar',
            description: error.toString(),
          );
        }
      } else if (next is AsyncData &&
          !next.isLoading &&
          previous is AsyncLoading) {
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: 'Berhasil melakukan pendaftaran',
        );

        setState(() => _isRedirecting = true);
        Future.delayed(const Duration(seconds: 3), () {
          if (!context.mounted) return;
          context.go(Routes.home);
        });
      }
    });

    final registerState = ref.watch(registerControllerProvider);
    final isLoading = registerState is AsyncLoading || _isRedirecting;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          return Stack(
            children: [
              // Background Image & Gradient
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height * 0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/login_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.onPrimaryContainer.withValues(alpha: 0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.1),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/icons/logo.png',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Daftar Akun Baru',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Scrollable Form Container
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.35),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AppTextField(
                                  controller: _nameController,
                                  label: 'NAMA',
                                  hint: 'Masukkan nama sesuai KTP',
                                  prefixIcon: const Icon(Icons.badge_outlined,
                                      size: 20),
                                  textCapitalization: TextCapitalization.words,
                                  errorText: _fieldErrors['name'],
                                ),
                                const SizedBox(height: 20),

                                AppTextField(
                                  controller: _emailController,
                                  label: 'EMAIL',
                                  hint: 'Masukkan alamat email',
                                  prefixIcon: const Icon(Icons.email_outlined,
                                      size: 20),
                                  keyboardType: TextInputType.emailAddress,
                                  errorText: _fieldErrors['email'],
                                ),
                                const SizedBox(height: 20),

                                AppTextField(
                                  controller: _phoneController,
                                  label: 'No. HP',
                                  hint: 'Masukkan nomor HP',
                                  prefixIcon: const Icon(Icons.phone_outlined,
                                      size: 20),
                                  keyboardType: TextInputType.phone,
                                  errorText: _fieldErrors['phone_number'],
                                ),
                                const SizedBox(height: 20),

                                AppTextPassword(
                                  controller: _passwordController,
                                  label: 'PASSWORD',
                                  hint: 'Buat password minimal 8 karakter',
                                  prefixIcon:
                                      const Icon(Icons.lock_outline, size: 20),
                                  errorText: _fieldErrors['password'],
                                ),
                                const SizedBox(height: 20),

                                AppTextPassword(
                                  controller: _passwordConfirmController,
                                  label: 'KONFIRMASI PASSWORD',
                                  hint: 'Ulangi password Anda',
                                  prefixIcon: const Icon(
                                      Icons.lock_reset_outlined,
                                      size: 20),
                                  errorText: _fieldErrors['password'],
                                ),
                                const SizedBox(height: 32),

                                // REGISTER BUTTON
                                PrimaryButton(
                                  label: 'Daftar Sekarang',
                                  isLoading: isLoading,
                                  onPressed: isLoading ? null : _handleRegister,
                                ),

                                const Spacer(),
                                const SizedBox(height: 24),

                                // LOGIN LINK
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sudah punya akun? ',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        fontSize: 14,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context.push(Routes.login),
                                      child: Text(
                                        'Masuk',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
