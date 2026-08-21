import 'package:app/core/domain/entities/app_file.dart';
import 'package:app/core/theme/app_text_style.dart';
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

  static const _warning = Color(0xFFFF9800);
  static const _darkWarning = Color(0xFF9E5F00);
  static const _middleWarning = Color(0xFFD88911);
  static const _tileWarning = Color(0xFFE89B22);
  static const _softWarning = Color(0xFFFFF1D8);
  static const _gold = Color(0xFFD3AB35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Menunggu Verifikasi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildVerificationSummaryCard(),
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'DATA DIRI'),
                    const SizedBox(height: 12),
                    _buildUserCard(context),
                    if (contract.userIdentityNumberFile != null) ...[
                      const SizedBox(height: 18),
                      _buildSectionTitle(context, 'DOKUMEN'),
                      const SizedBox(height: 12),
                      _buildKycCard(context, contract.userIdentityNumberFile!),
                    ],
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'DATA SAPI'),
                    const SizedBox(height: 12),
                    _buildCowCard(context),
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'PROGRAM KONTRAK'),
                    const SizedBox(height: 12),
                    _buildProgramCard(context),
                    const SizedBox(height: 18),
                    _buildSectionTitle(context, 'REKENING'),
                    const SizedBox(height: 12),
                    _buildBankCard(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            _darkWarning,
            _middleWarning,
            _warning,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: _warning.withValues(alpha: 0.18),
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
                  Icons.verified_user_outlined,
                  color: _warning,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menunggu Verifikasi',
                      style: AppTextStyles.title(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Admin sedang memverifikasi data kontrak Anda. Tidak ada tindakan yang perlu dilakukan saat ini.',
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
                  label: 'Total Modal',
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
        color: _tileWarning,
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
            color: _warning,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context) {
    return _buildDetailCard(
      context,
      children: [
        _buildSummaryRow(context, 'Nama Lengkap', contract.userName ?? '-'),
        _buildSummaryRow(context, 'NIK', contract.userIdentityNumber ?? '-'),
        if (contract.address != null && contract.address!.trim().isNotEmpty)
          _buildSummaryRow(context, 'Alamat', contract.address!),
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
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _whiteCardDecoration(context),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? _warning.withValues(alpha: 0.15)
                    : _softWarning,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.assignment_ind_rounded,
                color: _warning,
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
