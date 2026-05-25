import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ActiveContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const ActiveContractDetailPartial({
    super.key,
    required this.contract,
  });

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final _dateFormat = DateFormat('dd MMMM yyyy', 'id_ID');
  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _gold = Color(0xFFD3AB35);
  static const _pageBackground = Color(0xFFF5F0E6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Aktif',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroCard(context),
                    const SizedBox(height: 18),
                    _buildContractSummaryCard(context),
                    const SizedBox(height: 12),
                    _buildCowCard(context),
                    const SizedBox(height: 12),
                    _buildBankCard(context),
                    const SizedBox(height: 16),
                    _buildActions(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
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
            right: -52,
            top: -52,
            child: _buildSoftCircle(128),
          ),
          Positioned(
            left: -42,
            bottom: -58,
            child: _buildSoftCircle(116),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
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
                        Icons.verified_rounded,
                        color: _green,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kontrak aktif',
                            style: AppTextStyles.title(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            contract.contractNumber ?? 'SBB-${contract.id}',
                            style: AppTextStyles.body(
                              color: Colors.white.withValues(alpha: 0.78),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _gold,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        contract.status.value.toUpperCase(),
                        style: AppTextStyles.body(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Total modal',
                  style: AppTextStyles.body(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _currencyFormat.format(contract.cowTotalPrice ?? 0),
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: _buildHeroMetric(
                        label: 'Program',
                        value: contract.program?.value ?? '-',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildHeroMetric(
                        label: 'Durasi',
                        value: '${contract.contractMonthDuration ?? 0} bln',
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

  Widget _buildContractSummaryCard(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'RINGKASAN KONTRAK',
      children: [
        _buildSummaryRow(
            context, 'No. Kontrak', contract.contractNumber ?? '-'),
        _buildSummaryRow(context, 'Nama Lengkap', contract.userName ?? '-'),
        _buildSummaryRow(context, 'NIK', contract.userIdentityNumber ?? '-'),
        _buildSummaryRow(context, 'Program', contract.program?.value ?? '-'),
        _buildSummaryRow(
            context, 'Durasi', '${contract.contractMonthDuration ?? 0} Bulan'),
        _buildSummaryRow(
          context,
          'Tanggal Mulai',
          _formatDate(contract.startDate),
        ),
        _buildSummaryRow(
          context,
          'Tanggal Selesai',
          _formatDate(contract.endDate),
        ),
        _buildSummaryRow(context, 'Status', contract.status.value),
      ],
    );
  }

  Widget _buildCowCard(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'DATA SAPI',
      children: [
        _buildSummaryRow(context, 'Jenis Sapi', contract.cowName ?? '-'),
        _buildSummaryRow(
            context, 'Jumlah Sapi', '${contract.cowQuantity ?? 0} Ekor'),
        _buildSummaryRow(
            context, 'Berat Sapi', '${contract.cowWeightKg ?? 0} Kg'),
        _buildSummaryRow(
          context,
          'Harga Per Ekor',
          _currencyFormat.format(contract.cowPrice ?? 0),
        ),
        _buildSummaryRow(
          context,
          'Total Modal',
          _currencyFormat.format(contract.cowTotalPrice ?? 0),
        ),
      ],
    );
  }

  Widget _buildBankCard(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'REKENING',
      children: [
        _buildSummaryRow(context, 'Nama Bank', contract.bankName ?? '-'),
        _buildSummaryRow(
            context, 'Nomor Rekening', contract.bankAccountNumber ?? '-'),
        _buildSummaryRow(context, 'Atas Nama', contract.bankAccountName ?? '-'),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            label: 'Jadwal Pembayaran',
            icon: Icons.event_note_rounded,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Colors.white,
            onPressed: () => context.push(
              Routes.contractPaymentSchedules.replaceAll(
                ':id',
                contract.id.toString(),
              ),
              extra: contract,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            context,
            label: 'Sertifikat Kontrak',
            icon: Icons.workspace_premium_rounded,
            foregroundColor: Colors.white,
            backgroundColor: _green,
            onPressed: () => context.push(
              Routes.contractCertificate.replaceAll(
                ':id',
                contract.id.toString(),
              ),
              extra: contract,
            ),
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
    required VoidCallback onPressed,
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

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
          ),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value,
  ) {
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
              style: AppTextStyles.body(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return _dateFormat.format(date);
  }
}
