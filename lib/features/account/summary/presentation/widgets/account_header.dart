import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authSessionControllerProvider).value?.user;
    final name = user?.name ?? 'User';
    final email = user?.email ?? '-';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xFF1B4D3E),
        image: DecorationImage(
          image: AssetImage('assets/images/account_summary_bg.jpg'),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
            child: AppNetworkImage(
              imageUrl: user?.profilePictureUrl,
              width: 80,
              height: 80,
              borderRadius: 40,
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
                color: Colors.white.withValues(alpha: 0.2),
                child: const Center(
                  child: Text(
                    '👤',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: AppTextStyles.heading(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                email,
                style: AppTextStyles.body(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              if (user != null && user.emailVerifiedAt == null) ...[
                const SizedBox(width: 6),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 16),
          // if (partner == true)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       if (partner.level == 'partner' ||
          //           partner.level == 'partner_consultant')
          //         _buildBadge('Mitra', isActive: true),
          //       if (partner.level == 'partner_consultant')
          //         const SizedBox(width: 8),
          //       if (partner.level == 'consultant' ||
          //           partner.level == 'partner_consultant')
          //         _buildBadge('Konsultan', isActive: true),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
