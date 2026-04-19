import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/welcome/presentation/widgets/welcome_stat_divider.dart';
import 'package:app/features/welcome/presentation/widgets/welcome_stat_item.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.primary.withValues(alpha: 0.6),
                    AppColors.primaryDark.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                // Logo
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
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
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(height: 24),
                // Title
                const Text(
                  'Sarana Bahagia\nBerkah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Platform kemitraan penggemukan sapi\nberbasis syariah & teknologi digital',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                // Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const WelcomeStatItem(value: '500+', label: 'Mitra Aktif'),
                    const WelcomeStatDivider(),
                    const WelcomeStatItem(value: '1.200', label: 'Ekor Sapi'),
                    const WelcomeStatDivider(),
                    const WelcomeStatItem(value: '98%', label: 'Panen Sukses'),
                  ],
                ),
                const SizedBox(height: 48),
                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton(
                    label: 'Mulai Sekarang',
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryDark,
                    onPressed: () => context.push(Routes.homeGuest),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push(Routes.login),
                      child: const Text(
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
