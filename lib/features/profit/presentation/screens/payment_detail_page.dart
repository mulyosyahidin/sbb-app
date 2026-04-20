import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String amount = '+Rp 4.200.000';
    const String status = 'Sudah cair';
    const String txId = 'TX-SBB-2026-04-15-001';
    const String date = '15 April 2026, 09:45 WIB';
    const String method = 'Transfer Bank (BCA)';
    const String source = 'Bagi Hasil #SBB-007';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Pembayaran',
              subtitle: 'Keterangan rincian transaksi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Amount Hero
                    _buildAmountHero(context, amount, status),
                    const SizedBox(height: 32),

                    // Transaction Details
                    _buildSectionHeader(context, 'Detail Transaksi'),
                    const SizedBox(height: 12),
                    _buildInfoCard(context, [
                      _buildInfoRow(context, 'Jenis Transaksi', 'Bagi Hasil'),
                      _buildInfoRow(context, 'ID Transaksi', txId),
                      _buildInfoRow(context, 'Waktu', date),
                      _buildInfoRow(context, 'Metode', method),
                      _buildInfoRow(context, 'Sumber Dana', source),
                    ]),
                    const SizedBox(height: 32),

                    // Source Contract
                    _buildSectionHeader(context, 'Kontrak Terkait'),
                    const SizedBox(height: 12),
                    _buildContractCard(context),
                    const SizedBox(height: 48),

                    // Buttons
                    PrimaryButton(
                      label: 'Unduh Bukti Transfer',
                      onPressed: () {},
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    SecondaryButton(
                      label: 'Hubungi Tim Support',
                      onPressed: () {},
                      icon: const Icon(Icons.support_agent_rounded, size: 20),
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

  Widget _buildAmountHero(BuildContext context, String amount, String status) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          amount,
          style: AppTextStyles.hero(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: isDark ? 0.2 : 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: AppTextStyles.body(
              color: isDark ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.9) : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.title(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.body(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContractCard(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        Routes.contractDetail.replaceAll(':id', 'SBB-K-2025-088'),
      ),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.description_outlined,
                  color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#SBB-007 — Brahman Cross',
                    style: AppTextStyles.body(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Kontrak SBB-K-2025-088',
                    style: AppTextStyles.body(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
