import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';

class HomeGuestHeader extends StatelessWidget {
  const HomeGuestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "SBB",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sarana Bahagia Berkah',
                              style: AppTextStyles.body(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('Peternakan Digital',
                              style: AppTextStyles.label(
                                  color: AppColors.primaryContainer,
                                  letterSpacing: 0.5)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selamat Datang',
                            style: AppTextStyles.title(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('Yuk mulai kemitraan sekarang',
                            style: AppTextStyles.body(
                                color: Colors.white.withValues(alpha: 0.7))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
