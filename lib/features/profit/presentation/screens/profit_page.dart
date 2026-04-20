import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfitPage extends StatelessWidget {
  const ProfitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Profit & Laporan',
              subtitle: 'Riwayat bagi hasil kemitraan',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildSummaryCards(context),
                    const SizedBox(height: 24),
                    _buildMonthlyChart(context),
                    const SizedBox(height: 32),
                    Text(
                      'Riwayat Pembayaran',
                      style: AppTextStyles.title(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryList(),
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

  Widget _buildSummaryCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.account_balance_wallet_rounded,
                    color: Colors.orange, size: 28),
                const SizedBox(height: 16),
                Text(
                  'TOTAL PROFIT',
                  style: AppTextStyles.body(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp 45jt',
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.file_upload_outlined,
                    color: Colors.purple, size: 28),
                const SizedBox(height: 16),
                Text(
                  'SUDAH CAIR',
                  style: AppTextStyles.body(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp 38jt',
                  style: AppTextStyles.title(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthlyChart(BuildContext context) {
    final months = ['Okt', 'Nov', 'Des', 'Jan', 'Feb', 'Mar', 'Apr'];
    final values = [2.1, 3.4, 2.8, 4.2, 3.8, 5.1, 3.2];
    const maxValue = 6.0;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profit per bulan (juta Rp)',
            style: AppTextStyles.body(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(builder: (context, constraints) {
            const chartHeight = 110.0; // Base height for bars
            return SizedBox(
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(months.length, (index) {
                  final isHighlight = index == 5; // Mar
                  final barHeight = (values[index] / maxValue) * chartHeight;

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${values[index]}jt',
                          style: AppTextStyles.label(
                            fontSize: 9,
                            color: isHighlight
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          constraints: const BoxConstraints(maxWidth: 32),
                          height: barHeight,
                          decoration: BoxDecoration(
                            color: isHighlight
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          months[index],
                          style: AppTextStyles.body(
                            fontSize: 11,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    final items = [
      _HistoryItem(
        id: 'TX-001',
        title: 'Bagi Hasil — #SBB-007',
        subtitle: 'Kontrak SBB-K-2025-088',
        amount: '+Rp 4,2jt',
        status: 'Sudah cair',
        isPositive: true,
      ),
      _HistoryItem(
        id: 'TX-002',
        title: 'Bagi Hasil — #SBB-003',
        subtitle: 'Kontrak SBB-K-2025-071',
        amount: '+Rp 3,8jt',
        status: 'Sudah cair',
        isPositive: true,
      ),
      _HistoryItem(
        id: 'TX-003',
        title: 'Bagi Hasil — #SBB-014',
        subtitle: 'Kontrak SBB-K-2026-039',
        amount: '+Rp 3,2jt',
        status: 'Menunggu panen',
        isPositive: true,
        statusColor: const Color(0xFF9E6E16),
      ),
      _HistoryItem(
        id: 'TX-004',
        title: 'Komisi Konsultan',
        subtitle: '5 mitra aktif · Apr 2026',
        amount: '+Rp 2,5jt',
        status: 'Sudah cair',
        isPositive: true,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () => context.push(
            Routes.paymentDetail.replaceAll(':id', item.id),
          ),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppTextStyles.body(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: AppTextStyles.body(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.amount,
                      style: AppTextStyles.body(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.status,
                      style: AppTextStyles.body(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: item.statusColor ?? Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HistoryItem {
  final String id;
  final String title;
  final String subtitle;
  final String amount;
  final String status;
  final bool isPositive;
  final Color? statusColor;

  _HistoryItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
    required this.isPositive,
    this.statusColor,
  });
}
