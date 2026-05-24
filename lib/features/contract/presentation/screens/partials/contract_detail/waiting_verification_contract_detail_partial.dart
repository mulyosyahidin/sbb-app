import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/domain/entities/app_file.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class WaitingVerificationContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const WaitingVerificationContractDetailPartial({
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
              subtitle: 'Menunggu Verifikasi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildVerificationMessage(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Data Diri'),
                    const SizedBox(height: 12),
                    _buildUserCard(context),
                    if (contract.userIdentityNumberFile != null) ...[
                      const SizedBox(height: 12),
                      _buildKycCard(context, contract.userIdentityNumberFile!),
                    ],
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Data Sapi'),
                    const SizedBox(height: 12),
                    _buildCowCard(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Program Kontrak'),
                    const SizedBox(height: 12),
                    _buildProgramCard(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Rekening'),
                    const SizedBox(height: 12),
                    _buildBankCard(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'Ringkasan Pembayaran'),
                    const SizedBox(height: 12),
                    _buildPaymentSummaryCard(context),
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

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFF9800).withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9800).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xFFFF9800),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data sedang diverifikasi',
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Admin sedang memverifikasi data kontrak Anda. Tidak ada tindakan yang perlu dilakukan saat ini.',
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

  Widget _buildUserCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(context, 'Nama Lengkap', contract.userName ?? '-'),
        _buildSummaryRow(context, 'NIK', contract.userIdentityNumber ?? '-'),
      ],
    );
  }

  Widget _buildCowCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(context, 'Jenis Sapi', contract.cowName ?? '-'),
        _buildSummaryRow(
            context, 'Berat Sapi', '${contract.cowWeightKg ?? 0} Kg'),
        _buildSummaryRow(
          context,
          'Harga Per Ekor',
          _currencyFormat.format(contract.cowPrice ?? 0),
        ),
      ],
    );
  }

  Widget _buildProgramCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(context, 'Program', contract.program?.value ?? '-'),
        _buildSummaryRow(
            context, 'Durasi', '${contract.contractMonthDuration ?? 0} Bulan'),
        _buildSummaryRow(context, 'Status Kontrak', contract.status.value),
      ],
    );
  }

  Widget _buildBankCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(context, 'Nama Bank', contract.bankName ?? '-'),
        _buildSummaryRow(
            context, 'Nomor Rekening', contract.bankAccountNumber ?? '-'),
        _buildSummaryRow(context, 'Atas Nama', contract.bankAccountName ?? '-'),
      ],
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
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Modal',
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

  Widget _buildKycCard(BuildContext context, AppFile file) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () async {
        final url = Uri.parse(file.fileUrl);
        try {
          final launched = await launchUrl(
            url,
            mode: LaunchMode.inAppBrowserView,
          );
          if (!launched) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        } catch (e) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.assignment_ind_rounded,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kartu Tanda Penduduk (KTP)',
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    file.fileName,
                    style: AppTextStyles.body(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.open_in_new_rounded,
              size: 18,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
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
