import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Reward & Point',
              subtitle: 'Kumpulkan poin dan raih reward eksklusif',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPointDashboard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Program Reward SBB'),
                    const SizedBox(height: 16),
                    _buildRewardSection(
                      context,
                      title: 'Reward Umroh',
                      description:
                          'Wujudkan impian beribadah ke Tanah Suci melalui akumulasi poin kemitraan Anda.',
                      icon: Icons.mosque_outlined,
                      accentColor: Colors.amber,
                      details: [
                        'Kumpulkan 25.000 Poin untuk 1 Tiket Umroh.',
                        'Berlaku keberangkatan setiap musim Umroh.',
                        'Akomodasi hotel bintang 5 dan fasilitas premium.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildRewardSection(
                      context,
                      title: 'Reward Regular',
                      description:
                          'Tukarkan poin Anda dengan berbagai pilihan barang mewah dan kebutuhan gaya hidup.',
                      icon: Icons.card_giftcard_outlined,
                      accentColor: Colors.blue,
                      details: [
                        'Gadget: iPhone 15 Pro, Samsung S24 Ultra.',
                        'Emas Antam: Mulai dari 1 gram hingga 100 gram.',
                        'Voucher Belanja & Perjalanan senilai jutaan rupiah.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildRewardSection(
                      context,
                      title: 'Point per Member (PPM)',
                      description:
                          'Sistem apresiasi atas kontribusi Anda dalam membangun komunitas peternakan.',
                      icon: Icons.people_outline_rounded,
                      accentColor: Colors.teal,
                      details: [
                        'Dapatkan 100 Poin untuk setiap member baru.',
                        'Bonus 50 Poin saat referral melakukan restock.',
                        'Point PPM dapat digabungkan dengan Point Regular.',
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointDashboard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Poin Anda',
                style: AppTextStyles.body(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.stars_rounded, color: Colors.amber, size: 28),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '1,250',
            style: AppTextStyles.hero(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildStatMini(context, 'Umroh', '5% Complete'),
              const SizedBox(width: 24),
              _buildStatMini(context, 'Next Reward', 'Gold 1g'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatMini(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label(
            color: Colors.white.withValues(alpha: 0.7),
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildRewardSection(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color accentColor,
    required List<String> details,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTextStyles.body(
              color: colorScheme.onSurfaceVariant,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: details.map((detail) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_outline_rounded,
                        color: accentColor.withValues(alpha: 0.6), size: 16),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        detail,
                        style: AppTextStyles.body(
                          fontSize: 12,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
