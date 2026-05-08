import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/partner/application/partner_controller.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authSessionControllerProvider).value?.user;
    final partner = ref.watch(partnerControllerProvider).value;

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
                  color: Colors.white.withValues(alpha: 0.5), width: 2),
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
          Text(
            email,
            style: AppTextStyles.body(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          if (partner != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (partner.level == 'partner' ||
                    partner.level == 'partner_consultant')
                  _buildBadge('Mitra', isActive: true),
                if (partner.level == 'partner_consultant')
                  const SizedBox(width: 8),
                if (partner.level == 'consultant' ||
                    partner.level == 'partner_consultant')
                  _buildBadge('Konsultan', isActive: true),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFC8A55F).withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive
              ? const Color(0xFFC8A55F).withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.1),
          width: isActive ? 1.5 : 1,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.label(
          color: isActive ? const Color(0xFFC8A55F) : Colors.white,
          letterSpacing: 0,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}
