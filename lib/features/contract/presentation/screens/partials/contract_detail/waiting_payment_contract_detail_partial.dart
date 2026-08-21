import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class WaitingPaymentContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const WaitingPaymentContractDetailPartial({
    super.key,
    required this.contract,
  });

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _gold = Color(0xFFD3AB35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Menunggu Pembayaran',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildPaymentSummaryHero(),
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'RINGKASAN PEMBAYARAN'),
                    const SizedBox(height: 12),
                    _buildPaymentSummaryCard(context),
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'RINGKASAN KONTRAK'),
                    const SizedBox(height: 12),
                    _buildContractSummaryCard(context),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: 'Lanjut ke Pembayaran',
                      onPressed: () => context.push(
                        Routes.contractPayment.replaceAll(
                          ':id',
                          contract.id.toString(),
                        ),
                      ),
                      icon: const Icon(Icons.payments_rounded),
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

  Widget _buildPaymentSummaryHero() {
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
      child: Column(
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
                  Icons.payments_outlined,
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
                      'Menunggu Pembayaran',
                      style: AppTextStyles.title(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Kontrak Anda sudah diverifikasi. Silakan lanjutkan pembayaran untuk mengaktifkan kontrak.',
                      style: AppTextStyles.body(
                        fontSize: 13,
                        height: 1.45,
                        color: Colors.white.withValues(alpha: 0.76),
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
                  label: 'Total Bayar',
                  value: _currencyFormat.format(contract.cowTotalPrice ?? 0),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryMetric(
                  label: 'Jumlah Sapi',
                  value: '${contract.cowQuantity ?? 0} Ekor',
                ),
              ),
            ],
          ),
        ],
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

  Widget _buildPaymentSummaryCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(
            context, 'Jumlah Sapi', '${contract.cowQuantity ?? 0} Ekor'),
        _buildSummaryRow(
          context,
          'Harga Per Ekor',
          _currencyFormat.format(contract.cowPrice ?? 0),
        ),
        _buildSummaryRow(
          context,
          'Total Pembayaran',
          _currencyFormat.format(contract.cowTotalPrice ?? 0),
        ),
      ],
    );
  }

  Widget _buildContractSummaryCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(
            context, 'No. Kontrak', contract.contractNumber ?? '-'),
        _buildSummaryRow(context, 'Nama Lengkap', contract.userName ?? '-'),
        if (contract.address != null && contract.address!.trim().isNotEmpty)
          _buildSummaryRow(context, 'Alamat', contract.address!),
        _buildSummaryRow(context, 'Jenis Sapi', contract.cowName ?? '-'),
        _buildSummaryRow(context, 'Program', contract.program?.value ?? '-'),
        _buildSummaryRow(
            context, 'Durasi', '${contract.contractMonthDuration ?? 0} Bulan'),
        _buildSummaryRow(context, 'Status', contract.status.value),
      ],
    );
  }

  Widget _buildDetailCard(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.body(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
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
