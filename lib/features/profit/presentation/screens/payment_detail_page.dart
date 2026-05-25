import 'package:app/app/app_router.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/profit/application/profit_controller.dart';
import 'package:app/features/profit/domain/entities/profit_payment_history.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDetailPage extends ConsumerWidget {
  final String paymentId;

  const PaymentDetailPage({
    super.key,
    required this.paymentId,
  });

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);
  static const _pageBackground = Color(0xFFF5F0E6);

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final _dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profitState = ref.watch(profitControllerProvider);

    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Pembayaran',
              subtitle: 'Keterangan rincian transaksi',
            ),
            Expanded(
              child: profitState.when(
                data: (profit) {
                  final id = int.tryParse(paymentId);
                  final history = profit.paymentHistories
                      .where((item) => item.id == id)
                      .firstOrNull;

                  if (history == null) {
                    return _buildNotFound(context);
                  }

                  return _buildContent(context, history);
                },
                loading: () => const _PaymentDetailSkeleton(),
                error: (error, stackTrace) => _buildError(context, error, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProfitPaymentHistory history,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAmountHero(history),
          const SizedBox(height: 18),
          _buildSectionCard(
            context,
            title: 'DETAIL TRANSAKSI',
            children: [
              _buildInfoRow(context, 'Jenis Transaksi', 'Bagi Hasil'),
              _buildInfoRow(context, 'ID Transaksi', 'TX-${history.id}'),
              _buildInfoRow(
                  context, 'Tanggal Jadwal', _dateFormat.format(history.date)),
              _buildInfoRow(
                context,
                'Tanggal Cair',
                history.paidAt == null
                    ? '-'
                    : _dateFormat.format(history.paidAt!),
              ),
              _buildInfoRow(
                context,
                'Nominal Jadwal',
                _currencyFormat.format(history.nominal),
              ),
              _buildInfoRow(
                context,
                'Nominal Dibayar',
                _currencyFormat.format(history.paidNominal ?? history.nominal),
              ),
              _buildInfoRow(context, 'Status', _statusLabel(history.status)),
              _buildInfoRow(
                context,
                'Catatan',
                history.paymentNote?.isNotEmpty == true
                    ? history.paymentNote!
                    : '-',
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildContractCard(context, history),
          const SizedBox(height: 12),
          _buildProofCard(context, history),
          const SizedBox(height: 16),
          _buildActions(context, history),
        ],
      ),
    );
  }

  Widget _buildAmountHero(ProfitPaymentHistory history) {
    final paidNominal = history.paidNominal ?? history.nominal;

    return Container(
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
              Text(
                'Nominal pembayaran',
                style: AppTextStyles.body(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '+${_currencyFormat.format(paidNominal)}',
                style: AppTextStyles.title(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildHeroMetric(
                      label: 'Status',
                      value: _statusLabel(history.status),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildHeroMetric(
                      label: 'Tanggal Cair',
                      value: history.paidAt == null
                          ? '-'
                          : _dateFormat.format(history.paidAt!),
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

  Widget _buildHeroMetric({
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

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(context, title),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: AppTextStyles.body(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.body(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContractCard(
    BuildContext context,
    ProfitPaymentHistory history,
  ) {
    return InkWell(
      onTap: () => context.push(
        Routes.contractDetail.replaceAll(':id', history.contractId.toString()),
      ),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _whiteCardDecoration(),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _softGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.description_outlined,
                color: _green,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kontrak Terkait',
                    style: AppTextStyles.body(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    history.contractNumber,
                    style: AppTextStyles.body(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: _gold.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProofCard(
    BuildContext context,
    ProfitPaymentHistory history,
  ) {
    final proof = history.paymentProofFile;

    return _buildSectionCard(
      context,
      title: 'BUKTI PEMBAYARAN',
      children: [
        if (proof == null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Bukti pembayaran belum tersedia.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          )
        else ...[
          AppNetworkImage(
            imageUrl: proof.fileUrl,
            height: 180,
            width: double.infinity,
            borderRadius: 12,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          _buildInfoRow(context, 'Nama File', proof.fileName),
          _buildInfoRow(context, 'Tipe File', proof.fileType),
        ],
      ],
    );
  }

  Widget _buildActions(BuildContext context, ProfitPaymentHistory history) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            label: 'Buka Bukti',
            icon: Icons.open_in_new_rounded,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Colors.white,
            onPressed: history.paymentProofFile == null
                ? null
                : () => _openProof(context, history.paymentProofFile!.fileUrl),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            context,
            label: 'Bantuan',
            icon: Icons.support_agent_rounded,
            foregroundColor: Colors.white,
            backgroundColor: _green,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur bantuan belum tersedia.')),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color foregroundColor,
    required Color backgroundColor,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: Colors.white.withValues(alpha: 0.55),
          disabledForegroundColor:
              Theme.of(context).colorScheme.onSurfaceVariant,
          elevation: backgroundColor == Colors.white ? 0 : 2,
          shadowColor: _green.withValues(alpha: 0.18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
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

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: _whiteCardDecoration(),
          child: Text(
            'Data pembayaran tidak ditemukan.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, Object error, WidgetRef ref) {
    final message = error is Failure
        ? error.message
        : 'Gagal mendapatkan detail pembayaran';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: _whiteCardDecoration(),
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

  Future<void> _openProof(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL bukti pembayaran tidak valid.')),
      );
      return;
    }

    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal membuka bukti pembayaran.')),
      );
    }
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

  BoxDecoration _whiteCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}

class _PaymentDetailSkeleton extends StatelessWidget {
  const _PaymentDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      children: const [
        _AmountHeroSkeleton(),
        SizedBox(height: 18),
        _DetailSectionSkeleton(rowCount: 8),
        SizedBox(height: 12),
        _ContractLinkSkeleton(),
        SizedBox(height: 12),
        _ProofSectionSkeleton(),
        SizedBox(height: 16),
        _ActionButtonsSkeleton(),
      ],
    );
  }
}

class _AmountHeroSkeleton extends StatelessWidget {
  const _AmountHeroSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Skeleton(width: 150, height: 14, borderRadius: 6),
            SizedBox(height: 10),
            Skeleton(width: 220, height: 36, borderRadius: 8),
            SizedBox(height: 24),
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

class _DetailSectionSkeleton extends StatelessWidget {
  final int rowCount;

  const _DetailSectionSkeleton({
    required this.rowCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Skeleton(width: 7, height: 7, borderRadius: 4),
                SizedBox(width: 8),
                Skeleton(width: 132, height: 12, borderRadius: 6),
              ],
            ),
            const SizedBox(height: 20),
            ...List.generate(
              rowCount,
              (index) => Padding(
                padding:
                    EdgeInsets.only(bottom: index == rowCount - 1 ? 0 : 10),
                child: const _InfoRowSkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRowSkeleton extends StatelessWidget {
  const _InfoRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Skeleton(height: 12, borderRadius: 6),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.centerRight,
            child: Skeleton(width: 132, height: 12, borderRadius: 6),
          ),
        ),
      ],
    );
  }
}

class _ContractLinkSkeleton extends StatelessWidget {
  const _ContractLinkSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Row(
          children: [
            Skeleton(width: 42, height: 42, borderRadius: 12),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(width: 104, height: 12, borderRadius: 6),
                  SizedBox(height: 8),
                  Skeleton(width: 150, height: 14, borderRadius: 6),
                ],
              ),
            ),
            Skeleton(width: 22, height: 22, borderRadius: 6),
          ],
        ),
      ),
    );
  }
}

class _ProofSectionSkeleton extends StatelessWidget {
  const _ProofSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Column(
          children: [
            Row(
              children: [
                Skeleton(width: 7, height: 7, borderRadius: 4),
                SizedBox(width: 8),
                Skeleton(width: 130, height: 12, borderRadius: 6),
              ],
            ),
            SizedBox(height: 18),
            Skeleton(height: 180, borderRadius: 12),
            SizedBox(height: 14),
            _InfoRowSkeleton(),
            SizedBox(height: 10),
            _InfoRowSkeleton(),
          ],
        ),
      ),
    );
  }
}

class _ActionButtonsSkeleton extends StatelessWidget {
  const _ActionButtonsSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 52, borderRadius: 12),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 52, borderRadius: 12),
          ),
        ),
      ],
    );
  }
}
