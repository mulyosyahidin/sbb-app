import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaitingPaymentVerificationContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const WaitingPaymentVerificationContractDetailPartial({
    super.key,
    required this.contract,
  });

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Menunggu Verifikasi Pembayaran',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildVerificationMessage(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Ringkasan Pembayaran'),
                    const SizedBox(height: 12),
                    _buildPaymentSummaryCard(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Ringkasan Kontrak'),
                    const SizedBox(height: 12),
                    _buildContractSummaryCard(context),
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

  Widget _buildVerificationMessage(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const warningColor = Color(0xFFFF9800);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: warningColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: warningColor.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: warningColor.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.fact_check_outlined,
              color: warningColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran sedang diverifikasi',
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Admin sedang memeriksa bukti pembayaran Anda. Tidak ada tindakan yang perlu dilakukan saat ini.',
                  style: AppTextStyles.body(
                    fontSize: 13,
                    height: 1.45,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildPaymentSummaryCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryRow(
              context, 'Jumlah Sapi', '${contract.cowQuantity ?? 0} Ekor'),
          _buildSummaryRow(
            context,
            'Harga Per Ekor',
            _currencyFormat.format(contract.cowPrice ?? 0),
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                _currencyFormat.format(contract.cowTotalPrice ?? 0),
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContractSummaryCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(
            context, 'No. Kontrak', contract.contractNumber ?? '-'),
        _buildSummaryRow(context, 'Nama Lengkap', contract.userName ?? '-'),
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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline),
      ),
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
}
