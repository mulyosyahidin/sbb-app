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
              'assets/images/welcome_bg.webp',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.08),
                    AppColors.primary.withValues(alpha: 0.52),
                    AppColors.primaryDark.withValues(alpha: 0.94),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.22, 0.64, 1.0],
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
                SizedBox(
                  width: 104,
                  height: 104,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.18),
                              blurRadius: 24,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/logo.png',
                        height: 76,
                        width: 76,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                // Title
                const Text(
                  'Sarana Bahagia\nBerkah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0,
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
                const SizedBox(height: 44),
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
                const SizedBox(height: 44),
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
