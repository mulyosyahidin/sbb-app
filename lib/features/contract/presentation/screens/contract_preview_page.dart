import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/contract/application/contract_draft_controller.dart';
import 'package:app/features/contract/application/contract_list_controller.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractPreviewPage extends ConsumerStatefulWidget {
  const ContractPreviewPage({super.key});

  @override
  ConsumerState<ContractPreviewPage> createState() =>
      _ContractPreviewPageState();
}

class _ContractPreviewPageState extends ConsumerState<ContractPreviewPage> {
  bool isLoading = false;

  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final draftState = ref.watch(contractDraftControllerProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Preview Kontrak',
              subtitle: 'Periksa kembali data-data sebelum dikirim',
            ),
            Expanded(
              child: draftState.when(
                data: (contract) {
                  if (contract == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Tidak ada draft kontrak'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.pop(),
                            child: const Text('Kembali'),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionHeader(context, 'Data Diri'),
                        const SizedBox(height: 12),
                        _buildUserCard(context, contract),
                        if (contract.userIdentityNumberFile != null) ...[
                          const SizedBox(height: 12),
                          _buildKycCard(
                              context, contract.userIdentityNumberFile!),
                        ],
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, 'Data Sapi'),
                        const SizedBox(height: 12),
                        _buildCowCard(context, contract),
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, 'Program Kontrak'),
                        const SizedBox(height: 12),
                        _buildProgramCard(context, contract),
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, 'Rekening'),
                        const SizedBox(height: 12),
                        _buildBankCard(context, contract),
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, 'Ringkasan Pembayaran'),
                        const SizedBox(height: 12),
                        _buildPaymentSummaryCard(context, contract),
                        const SizedBox(height: 24),
                        _buildValidationMessage(context, contract),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          label: 'SUBMIT KONTRAK',
                          isLoading: isLoading,
                          onPressed:
                              isLoading || _isMissingRequiredFields(contract)
                                  ? null
                                  : () => _handleSubmit(contract),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('Gagal memuat draft: $error'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit(dynamic contract) async {
    setState(() => isLoading = true);

    final result = await ref
        .read(contractDraftControllerProvider.notifier)
        .submitContract();

    if (result != null && mounted) {
      ref.invalidate(contractListControllerProvider);

      context.go('${Routes.contract}/${result.id}');

      ToastUtil.showSuccess(
        context,
        title: 'Berhasil',
        description: 'Kontrak Anda telah berhasil diajukan',
      );
    }

    if (mounted) setState(() => isLoading = false);
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

  Widget _buildUserCard(BuildContext context, dynamic contract) {
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
        children: [
          _buildSummaryRow('Nama Lengkap', contract.userName ?? '-'),
          _buildSummaryRow('NIK', contract.userIdentityNumber ?? '-'),
        ],
      ),
    );
  }

  Widget _buildCowCard(BuildContext context, dynamic contract) {
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
        children: [
          _buildSummaryRow('Jenis Sapi', contract.cowName ?? '-'),
          _buildSummaryRow('Berat Sapi', '${contract.cowWeightKg ?? 0} Kg'),
          _buildSummaryRow(
              'Harga Per Ekor', currencyFormat.format(contract.cowPrice ?? 0)),
        ],
      ),
    );
  }

  Widget _buildBankCard(BuildContext context, dynamic contract) {
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
        children: [
          _buildSummaryRow('Nama Bank', contract.bankName ?? '-'),
          _buildSummaryRow('Nomor Rekening', contract.bankAccountNumber ?? '-'),
          _buildSummaryRow('Atas Nama', contract.bankAccountName ?? '-'),
        ],
      ),
    );
  }

  Widget _buildProgramCard(BuildContext context, dynamic contract) {
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
        children: [
          _buildSummaryRow('Program', contract.program?.value ?? '-'),
          _buildSummaryRow(
              'Durasi', '${contract.contractMonthDuration ?? 0} Bulan'),
        ],
      ),
    );
  }

  Widget _buildPaymentSummaryCard(BuildContext context, dynamic contract) {
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
          _buildSummaryRow('Jumlah Sapi', '${contract.cowQuantity ?? 0} Ekor'),
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
                currencyFormat.format(contract.cowTotalPrice ?? 0),
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

  bool _isMissingRequiredFields(dynamic contract) {
    return contract.userName == null ||
        contract.userIdentityNumber == null ||
        contract.userIdentityNumberFile == null ||
        contract.cowId == null ||
        contract.cowQuantity == null ||
        contract.bankAccountId == null ||
        contract.contractMonthDuration == null ||
        contract.program == null;
  }

  Widget _buildValidationMessage(BuildContext context, dynamic contract) {
    final missing = <String>[];
    if (contract.userName == null) missing.add('Nama');
    if (contract.userIdentityNumber == null) missing.add('NIK');
    if (contract.userIdentityNumberFile == null) missing.add('File KTP');
    if (contract.cowId == null) missing.add('Sapi');
    if (contract.cowQuantity == null) missing.add('Jumlah Sapi');
    if (contract.bankAccountId == null) missing.add('Bank');
    if (contract.contractMonthDuration == null) missing.add('Durasi');
    if (contract.program == null) missing.add('Program');

    if (missing.isEmpty) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.error.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.error_outline_rounded,
                  color: colorScheme.error, size: 20),
              const SizedBox(width: 8),
              Text(
                'Lengkapi Data Kontrak',
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.error,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Informasi berikut wajib diisi: ${missing.join(", ")}',
            style: AppTextStyles.body(
              color: colorScheme.error,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKycCard(BuildContext context, dynamic file) {
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

  Widget _buildSummaryRow(String label, String value) {
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
