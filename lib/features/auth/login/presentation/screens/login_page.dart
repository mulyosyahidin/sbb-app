import 'package:app/app/app_router.dart';
import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/auth/login/application/login_controller.dart';
import 'package:app/features/auth/login/presentation/widgets/google_login_button.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_text_password.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Map<String, String> _fieldErrors = {};

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() => _fieldErrors = {});

    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Email dan Password wajib diisi',
      );
      return;
    }

    ref.read(loginControllerProvider.notifier).login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
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
            title: 'Gagal Masuk',
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
        final authSession = ref.read(authSessionControllerProvider).value;
        if (authSession?.isAuthenticated ?? false) {
          ToastUtil.showSuccess(
            context,
            title: 'Berhasil',
            description: 'Selamat datang kembali!',
          );

          // Redirect to Home
          context.go(Routes.home);
        }
      }
    });

    final loginState = ref.watch(loginControllerProvider);
    final isLoading = loginState is AsyncLoading;

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
                                    'Masuk ke akun',
                                    style: AppTextStyles.title(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Gunakan email terdaftar untuk melanjutkan.',
                                    style: AppTextStyles.body(
                                      color:
                                          Colors.white.withValues(alpha: 0.76),
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  AppTextField(
                                    controller: _emailController,
                                    label: 'EMAIL',
                                    prefixIcon: const Icon(Icons.email_outlined,
                                        size: 20),
                                    keyboardType: TextInputType.emailAddress,
                                    errorText: _fieldErrors['email'],
                                  ),
                                  const SizedBox(height: 20),
                                  AppTextPassword(
                                    controller: _passwordController,
                                    label: 'PASSWORD',
                                    prefixIcon: const Icon(Icons.lock_outline,
                                        size: 20),
                                    errorText: _fieldErrors['password'],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        // TODO: Forgot password
                                      },
                                      child: Text(
                                        'Lupa Password?',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.88),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  PrimaryButton(
                                    label: 'Masuk Sekarang',
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColors.primaryDark,
                                    isLoading: isLoading,
                                    onPressed: isLoading ? null : _handleLogin,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildDivider(),
                                  const SizedBox(height: 24),
                                  GoogleLoginButton(
                                    isLoading: isLoading,
                                    onPressed: () {
                                      ref
                                          .read(
                                              loginControllerProvider.notifier)
                                          .loginWithGoogle();
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Belum punya akun? ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.72),
                                          fontSize: 14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            context.push(Routes.register),
                                        child: Text(
                                          'Daftar sekarang',
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
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.textPrimaryLight,
          side: BorderSide(color: Colors.white.withValues(alpha: 0.82)),
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
          'Selamat datang kembali.',
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
          'Pantau kontrak, profit, dan aktivitas investasi ternak Anda dengan lebih mudah.',
          style: AppTextStyles.body(
            color: Colors.white.withValues(alpha: 0.76),
            fontSize: 13,
            height: 1.45,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.white.withValues(alpha: 0.22)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Atau masuk dengan',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.68),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.white.withValues(alpha: 0.22)),
        ),
      ],
    );
  }
}
