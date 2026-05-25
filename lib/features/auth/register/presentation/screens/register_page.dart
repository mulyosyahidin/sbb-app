import 'package:app/app/app_router.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
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
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  Map<String, String> _fieldErrors = {};
  bool _isRedirecting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
          password: _passwordController.text,
          passwordConfirmation: _passwordConfirmController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerControllerProvider, (previous, next) {
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
            title: 'Gagal Mendaftar',
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
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/login_bg.webp',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.10),
                        AppColors.primary.withValues(alpha: 0.34),
                        AppColors.primaryDark.withValues(alpha: 0.92),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.08, 0.46, 1.0],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
                            child: _buildHero(context),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
                            child: Theme(
                              data: _buildFormTheme(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Buat akun baru',
                                    style: AppTextStyles.title(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Daftar untuk mulai mengakses program dan laporan investasi.',
                                    style: AppTextStyles.body(
                                      color:
                                          Colors.white.withValues(alpha: 0.76),
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  AppTextField(
                                    controller: _nameController,
                                    label: 'NAMA',
                                    prefixIcon: const Icon(Icons.badge_outlined,
                                        size: 20),
                                    textCapitalization:
                                        TextCapitalization.words,
                                    errorText: _fieldErrors['name'],
                                  ),
                                  const SizedBox(height: 18),
                                  AppTextField(
                                    controller: _emailController,
                                    label: 'EMAIL',
                                    prefixIcon: const Icon(Icons.email_outlined,
                                        size: 20),
                                    keyboardType: TextInputType.emailAddress,
                                    errorText: _fieldErrors['email'],
                                  ),
                                  const SizedBox(height: 18),
                                  AppTextPassword(
                                    controller: _passwordController,
                                    label: 'PASSWORD',
                                    prefixIcon: const Icon(Icons.lock_outline,
                                        size: 20),
                                    errorText: _fieldErrors['password'],
                                  ),
                                  const SizedBox(height: 18),
                                  AppTextPassword(
                                    controller: _passwordConfirmController,
                                    label: 'KONFIRMASI PASSWORD',
                                    prefixIcon: const Icon(
                                        Icons.lock_reset_outlined,
                                        size: 20),
                                    errorText: _fieldErrors['password'],
                                  ),
                                  const SizedBox(height: 28),
                                  PrimaryButton(
                                    label: 'Daftar Sekarang',
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColors.primaryDark,
                                    isLoading: isLoading,
                                    onPressed:
                                        isLoading ? null : _handleRegister,
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sudah punya akun? ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.72),
                                          fontSize: 14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => context.push(Routes.login),
                                        child: Text(
                                          'Masuk',
                                          style: TextStyle(
                                            color: Colors.white,
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

  ThemeData _buildFormTheme(BuildContext context) {
    final base = Theme.of(context);

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.white,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.white.withValues(alpha: 0.72),
        surface: Colors.white.withValues(alpha: 0.12),
        outline: Colors.white.withValues(alpha: 0.26),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        fillColor: Colors.white.withValues(alpha: 0.12),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.54)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.24),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: base.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: base.colorScheme.error, width: 1.4),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 58,
              height: 58,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 44,
                    height: 44,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarana Bahagia Berkah',
                    style: AppTextStyles.body(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Peternakan digital',
                    style: AppTextStyles.body(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 34),
        Text(
          'Mulai perjalanan investasi Anda.',
          style: AppTextStyles.title(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            height: 1.12,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Buat akun untuk melihat peluang kemitraan, kontrak, dan dokumentasi peternakan.',
          style: AppTextStyles.body(
            color: Colors.white.withValues(alpha: 0.76),
            fontSize: 13,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
