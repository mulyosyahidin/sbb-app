import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/contract/application/contract_detail_controller.dart';
import 'package:app/features/contract/application/contract_document_controller.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ContractCertificatePage extends ConsumerWidget {
  final String contractId;
  final Contract? initialContract;

  const ContractCertificatePage({
    super.key,
    required this.contractId,
    this.initialContract,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialContract != null) {
      return _ContractCertificateContent(contract: initialContract!);
    }

    final contractState =
        ref.watch(contractDetailControllerProvider(contractId));

    return contractState.when(
      data: (contract) => _ContractCertificateContent(contract: contract),
      loading: () => const _ContractCertificateLoadingPage(),
      error: (error, stackTrace) => _ContractCertificateErrorPage(error: error),
    );
  }
}

class _ContractCertificateContent extends ConsumerWidget {
  final Contract contract;

  const _ContractCertificateContent({
    required this.contract,
  });

  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

  static final _dateFormat = DateFormat('dd MMM yyyy', 'id_ID');
  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(contractDocumentControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        ToastUtil.showError(
          context,
          title: 'Gagal',
          description: error is Failure ? error.message : error.toString(),
        );
      }
    });

    final documentState = ref.watch(contractDocumentControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Sertifikat Kontrak',
              subtitle: 'Kepemilikan Sapi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroCard(context),
                    const SizedBox(height: 18),
                    _buildCertificateNumberCard(context),
                    const SizedBox(height: 18),
                    _buildOwnerSection(context),
                    const SizedBox(height: 12),
                    _buildCowSection(context),
                    const SizedBox(height: 12),
                    _buildValiditySection(context),
                    const SizedBox(height: 12),
                    _buildVerificationSection(context),
                    const SizedBox(height: 12),
                    _buildLegalNotice(context),
                    const SizedBox(height: 16),
                    _buildActions(
                      context,
                      ref,
                      isLoading: documentState.isLoading,
                    ),
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
      height: 178,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF176421),
            Color(0xFF2C8A3C),
            Color(0xFF155B24),
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
            right: -28,
            top: -34,
            child: _buildSoftCircle(116),
          ),
          Positioned(
            left: -36,
            bottom: -52,
            child: _buildSoftCircle(112),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 58,
                  height: 58,
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
                  child: Center(
                    child: Text(
                      'SBB',
                      style: AppTextStyles.title(
                        color: _green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Sarana Bahagia Berkah',
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Peternakan Digital Terverifikasi',
                  style: AppTextStyles.body(
                    color: Colors.white.withValues(alpha: 0.76),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  decoration: BoxDecoration(
                    color: _gold,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'SERTIFIKAT KEPEMILIKAN SAPI',
                    style: AppTextStyles.body(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

  Widget _buildCertificateNumberCard(BuildContext context) {
    return _buildWhiteCard(
      context,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        children: [
          Text(
            'NO. SERTIFIKAT',
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _certificateNumber,
            textAlign: TextAlign.center,
            style: AppTextStyles.title(
              color: _green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerSection(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'DATA PEMILIK',
      children: [
        _buildInfoRow(
            context, 'Nama lengkap', contract.userName ?? 'Anto Rahma'),
        _buildInfoRow(
          context,
          'NIK',
          contract.userIdentityNumber ?? '3603128407027802',
        ),
        _buildInfoRow(context, 'Bergabung', _formatDate(contract.startDate)),
      ],
    );
  }

  Widget _buildCowSection(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'DATA SAPI',
      children: [
        _buildInfoRow(context, 'ID Sapi', _cowCode),
        _buildInfoRow(context, 'Jenis', contract.cowName ?? 'BX Steer'),
        _buildInfoRow(context, 'Kandang', 'Cariu, Jawa Barat'),
        _buildInfoRow(context, 'Berat rata-rata', _cowWeight),
        _buildInfoRow(context, 'Program', _programLabel),
        _buildInfoRow(context, 'Durasi kontrak', _durationLabel),
        _buildInfoRow(
          context,
          'Nilai pembelian',
          _currencyFormat.format(contract.cowTotalPrice ?? 18000000),
          valueColor: _gold,
        ),
      ],
    );
  }

  Widget _buildValiditySection(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'MASA BERLAKU',
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDateBox(
                context,
                label: 'Mulai',
                value: _formatDate(contract.startDate),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateBox(
                context,
                label: 'Berakhir',
                value: _formatDate(contract.endDate),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVerificationSection(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'VERIFIKASI',
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DummyQrCode(size: 80),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _certificateUrl,
                    style: AppTextStyles.body(
                      color: _green,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildVerificationRow('Terverifikasi SBB'),
                  _buildVerificationRow('Kontrak sah secara hukum'),
                  _buildVerificationRow('Dokumen tidak dapat dipalsukan'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVerificationRow(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: _softGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: _green,
              size: 11,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.body(
                color: _green,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalNotice(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? _gold.withValues(alpha: 0.1)
            : const Color(0xFFFAF7EF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? _gold.withValues(alpha: 0.2)
              : const Color(0xFFEAE0C8),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Diterbitkan oleh PT Sarana Bahagia Berkah',
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'Dokumen ini sah secara hukum dan tidak dapat dipalsukan.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(
    BuildContext context,
    WidgetRef ref, {
    required bool isLoading,
  }) {
    return _buildActionButton(
      context,
      label: 'Unduh PDF',
      icon: Icons.file_download_outlined,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      backgroundColor: Theme.of(context).colorScheme.surface,
      isOutlined: true,
      isLoading: isLoading,
      onPressed: contract.isDocumentAccepted && !isLoading
          ? () => _sendContractDocument(context, ref)
          : null,
    );
  }

  Future<void> _sendContractDocument(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final message = await ref
        .read(contractDocumentControllerProvider.notifier)
        .sendContractDocument(contractId: contract.id);

    if (!context.mounted || message == null) return;

    ToastUtil.showSuccess(
      context,
      title: 'Berhasil',
      description: message,
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color foregroundColor,
    required Color backgroundColor,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isOutlined = false,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: isOutlined ? 0 : 2,
          shadowColor: _green.withValues(alpha: 0.18),
          side: isOutlined
              ? BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: 0.5),
                )
              : BorderSide.none,
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
    return _buildWhiteCard(
      context,
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
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildWhiteCard(
    BuildContext context, {
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
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
      ),
      child: child,
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

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
                color: colorScheme.onSurfaceVariant,
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
                color: valueColor ?? colorScheme.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBox(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(
        color: _softGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBE9BC)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTextStyles.body(
              color: _green.withValues(alpha: 0.72),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyles.body(
                color: _green,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get _certificateNumber {
    final year = (contract.startDate ?? contract.createdAt).year;
    return 'SBB-CERT-$year-${contract.id.toString().padLeft(3, '0')}';
  }

  String get _certificateUrl {
    final year = (contract.startDate ?? contract.createdAt).year;
    return 'sbb.id/cert/$year-${contract.id.toString().padLeft(3, '0')}';
  }

  String get _cowCode {
    final cowId = contract.cowId;
    if (cowId == null) return '#SBB-014';
    return '#SBB-${cowId.toString().padLeft(3, '0')}';
  }

  String get _cowWeight {
    final weight = contract.cowWeightKg;
    if (weight == null) return '500 kg/ekor';
    return '$weight kg/ekor';
  }

  String get _programLabel {
    final program = contract.program?.value ?? 'Titip Sapi';
    return '$program - Regular';
  }

  String get _durationLabel {
    final duration = contract.contractMonthDuration ?? 12;
    return '$duration bulan';
  }

  String _formatDate(DateTime? date) {
    return _dateFormat.format(date ?? DateTime(2026, 4, 28));
  }
}

class _DummyQrCode extends StatelessWidget {
  final double size;

  const _DummyQrCode({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.28),
        ),
      ),
      child: CustomPaint(
        painter: _DummyQrPainter(),
      ),
    );
  }
}

class _DummyQrPainter extends CustomPainter {
  static const _matrix = [
    '1111111010101111111',
    '1000001011101000001',
    '1011101010001011101',
    '1011101011101011101',
    '1011101000101011101',
    '1000001010101000001',
    '1111111010101111111',
    '0000000011100000000',
    '1010111110111010101',
    '0111000010100011100',
    '1110111011111010111',
    '0010101000001011000',
    '1111111010111110101',
    '1000001000100010110',
    '1011101011101111101',
    '1011101000111000010',
    '1011101010101110111',
    '1000001011001001000',
    '1111111010111011111',
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final cellSize = size.width / _matrix.length;

    for (var y = 0; y < _matrix.length; y++) {
      for (var x = 0; x < _matrix[y].length; x++) {
        if (_matrix[y][x] == '1') {
          canvas.drawRect(
            Rect.fromLTWH(
              x * cellSize,
              y * cellSize,
              cellSize,
              cellSize,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ContractCertificateLoadingPage extends StatelessWidget {
  const _ContractCertificateLoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Sertifikat Kontrak',
              subtitle: 'Memuat data',
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContractCertificateErrorPage extends StatelessWidget {
  final Object error;

  const _ContractCertificateErrorPage({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final message = error is Failure
        ? (error as Failure).message
        : 'Gagal mendapatkan sertifikat kontrak';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Sertifikat Kontrak',
              subtitle: 'Terjadi kesalahan',
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
