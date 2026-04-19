import 'package:app/features/home/application/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(fetchHomeDataProvider).value;
    final userName = homeData?.user?.name ?? 'User';

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
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
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Peternakan Digital',
                        style: AppTextStyles.label(
                            color: AppColors.primaryContainer,
                            letterSpacing: 0.5)),
                  ],
                ),
              ),
              _buildHeaderIcon(Icons.photo_outlined),
              const SizedBox(width: 8),
              _buildHeaderIcon(Icons.notifications_outlined),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.white.withValues(alpha: 0.2),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildBadge('MITRA', AppColors.primaryLight),
                          const SizedBox(width: 6),
                          _buildBadge(
                              'KONSULTAN', Colors.white.withValues(alpha: 0.2)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('Halo, $userName!',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.body(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      const SizedBox(height: 2),
                      Text('2 sapi dimiliki',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.label(
                              color: AppColors.primaryContainer,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
    );
  }
}
