import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/auth/login/presentation/widgets/google_icon.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_text_password.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                height: height * 0.45,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.5),
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
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Sarana Bahagia Berkah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                        SizedBox(height: height * 0.38),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AppTextField(
                                  label: 'NOMOR HP / EMAIL',
                                  hint: 'Masukkan nomor HP atau email',
                                  prefixIcon: const Icon(Icons.person_outline,
                                      size: 20),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),

                                // PASSWORD
                                AppTextPassword(
                                  label: 'PASSWORD',
                                  hint: 'Masukkan password',
                                  prefixIcon:
                                      const Icon(Icons.lock_outline, size: 20),
                                ),
                                const SizedBox(height: 24),

                                // MASUK BUTTON
                                PrimaryButton(
                                  label: 'Masuk',
                                  onPressed: () {},
                                ),
                                const SizedBox(height: 32),

                                // DIVIDER
                                Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                            color: Colors.grey.shade300)),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        'atau masuk dengan',
                                        style: TextStyle(
                                          color: AppColors.textSecondaryLight,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Divider(
                                            color: Colors.grey.shade300)),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // GOOGLE LOGIN BUTTON
                                SecondaryButton(
                                  label: 'Masuk dengan Google',
                                  icon: const GoogleIcon(),
                                  onPressed: () {},
                                ),

                                const Spacer(),
                                const SizedBox(height: 24),

                                // REGISTER LINK
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Belum punya akun? ',
                                      style: TextStyle(
                                        color: AppColors.textSecondaryLight,
                                        fontSize: 14,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context.push(Routes.register),
                                      child: const Text(
                                        'Daftar sekarang',
                                        style: TextStyle(
                                          color: AppColors.primaryDark,
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
