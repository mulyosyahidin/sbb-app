import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';

class PartnerUpgradePage extends StatelessWidget {
  const PartnerUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Upgrade Konsultan',
              subtitle: 'Tingkatkan level kemitraan Anda sekarang',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroSection(context),
                    const SizedBox(height: 32),
                    Text(
                      'Keuntungan Menjadi Konsultan',
                      style: AppTextStyles.title(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildBenefitItem(
                      context,
                      icon: Icons.local_offer_outlined,
                      title: 'Harga Lebih Kompetitif',
                      description:
                          'Dapatkan akses ke harga investasi khusus yang lebih rendah dan margin keuntungan yang lebih tinggi.',
                    ),
                    const SizedBox(height: 16),
                    _buildBenefitItem(
                      context,
                      icon: Icons.groups_outlined,
                      title: 'Keuntungan Referral',
                      description:
                          'Program kemitraan berjenjang yang memungkinkan Anda mendapatkan pasif income dari jaringan Anda.',
                    ),
                    const SizedBox(height: 16),
                    _buildBenefitItem(
                      context,
                      icon: Icons.support_agent_outlined,
                      title: 'Prioritas Support',
                      description:
                          'Layanan bantuan prioritas 24/7 untuk membantu Anda mengelola investasi dan jaringan.',
                    ),
                    const SizedBox(height: 48),
                    PrimaryButton(
                      label: 'KIRIM PENGAJUAN',
                      onPressed: () => _handleSubmission(context),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.1),
            colorScheme.primary.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.trending_up, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            'Siap untuk Level Selanjutnya?',
            style: AppTextStyles.title(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Beralih ke akun Konsultan untuk memaksimalkan potensi investasi dan penghasilan Anda.',
            style: AppTextStyles.body(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTextStyles.label(
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 0,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleSubmission(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Pengajuan Terkirim'),
        content: const Text(
          'Terima kasih! Pengajuan upgrade Anda telah kami terima dan akan segera diproses oleh tim kami.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              context.pop(); // Pop back to partner profile
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
