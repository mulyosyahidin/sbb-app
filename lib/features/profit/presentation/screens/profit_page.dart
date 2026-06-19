import 'package:app/app/app_router.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/profit/application/profit_controller.dart';
import 'package:app/features/profit/domain/entities/profit.dart';
import 'package:app/features/profit/domain/entities/profit_monthly_paid.dart';
import 'package:app/features/profit/domain/entities/profit_payment_history.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProfitPage extends ConsumerWidget {
  const ProfitPage({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profitState = ref.watch(profitControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Profit & Laporan',
              subtitle: 'Riwayat bagi hasil kemitraan',
            ),
            Expanded(
              child: profitState.when(
                data: (profit) => _buildContent(context, profit),
                loading: () => const _ProfitPageSkeleton(),
                error: (error, stackTrace) => _buildError(context, error, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Profit profit) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryCard(profit),
          const SizedBox(height: 18),
          _buildMonthlyChart(context, profit.last6MonthsPaid),
          const SizedBox(height: 18),
          _buildHistorySection(context, profit.paymentHistories),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(Profit profit) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            right: -42,
            top: -50,
            child: _buildSoftCircle(128),
          ),
          Positioned(
            left: -46,
            bottom: -60,
            child: _buildSoftCircle(116),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: _green,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total profit',
                          style: AppTextStyles.body(
                            color: Colors.white.withValues(alpha: 0.72),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _currencyFormat
                                .format(profit.summary.totalPotentialProfit),
                            style: AppTextStyles.title(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryMetric(
                      label: 'Sudah Cair',
                      value: _currencyFormat.format(profit.summary.paid),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryMetric(
                      label: 'Menunggu',
                      value: _currencyFormat.format(profit.summary.waiting),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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

  Widget _buildSummaryMetric({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _tileGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body(
              color: Colors.white.withValues(alpha: 0.72),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: AppTextStyles.title(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyChart(
    BuildContext context,
    List<ProfitMonthlyPaid> months,
  ) {
    final maxValue = months.fold<double>(
      0,
      (max, item) => item.totalPaid > max ? item.totalPaid : max,
    );
    final effectiveMax = maxValue <= 0 ? 1 : maxValue;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, 'PROFIT PER BULAN'),
          const SizedBox(height: 22),
          if (months.isEmpty)
            _buildEmptyMessage(context, 'Belum ada data profit bulanan.')
          else
            SizedBox(
              height: 178,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(months.length, (index) {
                  final item = months[index];
                  final isHighlight =
                      item.totalPaid == maxValue && maxValue > 0;
                  final barHeight = (item.totalPaid / effectiveMax) * 110;

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _formatCompactCurrency(item.totalPaid),
                          style: AppTextStyles.label(
                            fontSize: 9,
                            color: isHighlight
                                ? _green
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          constraints: const BoxConstraints(maxWidth: 32),
                          height: item.totalPaid <= 0 ? 8 : barHeight,
                          decoration: BoxDecoration(
                            color: isHighlight
                                ? _green
                                : (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? _green.withValues(alpha: 0.15)
                                    : _softGreen),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item.label.split(' ').first,
                          style: AppTextStyles.body(
                            fontSize: 11,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHistorySection(
    BuildContext context,
    List<ProfitPaymentHistory> histories,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(context, 'RIWAYAT PEMBAYARAN'),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 12),
          if (histories.isEmpty)
            _buildEmptyMessage(context, 'Belum ada riwayat pembayaran.')
          else
            _buildHistoryList(histories),
        ],
      ),
    );
  }

  Widget _buildHistoryList(List<ProfitPaymentHistory> histories) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: histories.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.16),
      ),
      itemBuilder: (context, index) {
        final item = histories[index];
        final status = _statusLabel(item.status);
        final statusColor =
            item.status == 'berhasil' ? _green : const Color(0xFF9E6E16);

        return InkWell(
          onTap: () => context.push(
            Routes.paymentDetail.replaceAll(':id', item.id.toString()),
          ),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? _green.withValues(alpha: 0.15)
                        : _softGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.payments_outlined,
                    color: _green,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bagi Hasil - ${item.contractNumber}',
                        style: AppTextStyles.body(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Kontrak ${item.contractNumber}',
                        style: AppTextStyles.body(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '+${_currencyFormat.format(item.paidNominal ?? item.nominal)}',
                      style: AppTextStyles.body(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: _green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status,
                      style: AppTextStyles.body(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: _gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.body(
            color: _green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyMessage(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles.body(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, Object error, WidgetRef ref) {
    final message =
        error is Failure ? error.message : 'Gagal mendapatkan data profit';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: _whiteCardDecoration(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 40,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => ref.invalidate(profitControllerProvider),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCompactCurrency(double value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)}M';
    }
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(value % 1000000 == 0 ? 0 : 1)}jt';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}rb';
    }
    return '0';
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'berhasil':
        return 'Sudah cair';
      case 'pending':
        return 'Terjadwal';
      default:
        return status;
    }
  }

  BoxDecoration _whiteCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
        width: 0.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor.withValues(alpha: 0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}

class _ProfitPageSkeleton extends StatelessWidget {
  const _ProfitPageSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      children: const [
        _ProfitSummarySkeleton(),
        SizedBox(height: 18),
        _ProfitChartSkeleton(),
        SizedBox(height: 18),
        _ProfitHistorySkeleton(),
      ],
    );
  }
}

class _ProfitSummarySkeleton extends StatelessWidget {
  const _ProfitSummarySkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Skeleton(width: 48, height: 48, borderRadius: 14),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 88, height: 13, borderRadius: 6),
                      SizedBox(height: 8),
                      Skeleton(width: 190, height: 28, borderRadius: 8),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Skeleton(height: 68, borderRadius: 14)),
                SizedBox(width: 12),
                Expanded(child: Skeleton(height: 68, borderRadius: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfitChartSkeleton extends StatelessWidget {
  const _ProfitChartSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Skeleton(width: 7, height: 7, borderRadius: 4),
                SizedBox(width: 8),
                Skeleton(width: 130, height: 12, borderRadius: 6),
              ],
            ),
            SizedBox(height: 22),
            SizedBox(
              height: 178,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _BarSkeleton(height: 72),
                  _BarSkeleton(height: 104),
                  _BarSkeleton(height: 56),
                  _BarSkeleton(height: 126),
                  _BarSkeleton(height: 88),
                  _BarSkeleton(height: 112),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarSkeleton extends StatelessWidget {
  final double height;

  const _BarSkeleton({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Skeleton(width: 34, height: 10, borderRadius: 5),
          const SizedBox(height: 8),
          Skeleton(width: 28, height: height, borderRadius: 6),
          const SizedBox(height: 12),
          const Skeleton(width: 28, height: 11, borderRadius: 5),
        ],
      ),
    );
  }
}

class _ProfitHistorySkeleton extends StatelessWidget {
  const _ProfitHistorySkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
        child: const Column(
          children: [
            Row(
              children: [
                Skeleton(width: 7, height: 7, borderRadius: 4),
                SizedBox(width: 8),
                Skeleton(width: 150, height: 12, borderRadius: 6),
              ],
            ),
            SizedBox(height: 22),
            _HistoryRowSkeleton(),
            SizedBox(height: 18),
            _HistoryRowSkeleton(),
            SizedBox(height: 18),
            _HistoryRowSkeleton(),
            SizedBox(height: 18),
            _HistoryRowSkeleton(),
          ],
        ),
      ),
    );
  }
}

class _HistoryRowSkeleton extends StatelessWidget {
  const _HistoryRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(width: 38, height: 38, borderRadius: 10),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(height: 14, borderRadius: 6),
              SizedBox(height: 8),
              Skeleton(width: 130, height: 12, borderRadius: 6),
            ],
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Skeleton(width: 92, height: 15, borderRadius: 6),
            SizedBox(height: 8),
            Skeleton(width: 62, height: 11, borderRadius: 6),
          ],
        ),
      ],
    );
  }
}
