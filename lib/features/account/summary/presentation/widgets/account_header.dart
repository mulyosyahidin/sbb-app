import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/auth/domain/entities/auth_driver.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _gold = Color(0xFFD3AB35);
  static const _pageBackground = Color(0xFFF5F0E6);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authSessionControllerProvider).value?.user;
    final name = user?.name ?? 'User';
    final email = user?.email ?? '-';
    final isEmailUser = user?.driver == AuthDriver.email;

    return Container(
      width: double.infinity,
      color: _pageBackground,
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [
              _darkGreen,
              Color(0xFF2C8A3C),
              _green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: _green.withValues(alpha: 0.18),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -38,
              top: -46,
              child: _buildSoftCircle(128),
            ),
            Positioned(
              left: -44,
              bottom: -58,
              child: _buildSoftCircle(116),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                  child: AppNetworkImage(
                    imageUrl: user?.profilePictureUrl,
                    width: 82,
                    height: 82,
                    borderRadius: 41,
                    placeholder: Container(
                      color: Colors.white.withValues(alpha: 0.2),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    errorWidget: Container(
                      color: Colors.white.withValues(alpha: 0.18),
                      child: const Center(
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body(
                          color: Colors.white.withValues(alpha: 0.74),
                        ),
                      ),
                    ),
                    if (isEmailUser && user?.emailVerifiedAt == null) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: _gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                if (isEmailUser) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: _tileGreen,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      user?.emailVerifiedAt == null
                          ? 'MENUNGGU VERIFIKASI'
                          : 'AKUN TERVERIFIKASI',
                      style: AppTextStyles.body(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoftCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        shape: BoxShape.circle,
      ),
    );
  }
}
