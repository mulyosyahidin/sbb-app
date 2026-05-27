import 'dart:io';

import 'package:app/app/app_router.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/contract/application/contract_detail_controller.dart';
import 'package:app/features/contract/application/contract_payment_controller.dart';
import 'package:app/features/contract/data/dtos/requests/store_payment_proof_request_dto.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/forms/app_file_picker_field.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ContractPaymentPage extends ConsumerStatefulWidget {
  final String contractId;

  const ContractPaymentPage({
    super.key,
    required this.contractId,
  });

  @override
  ConsumerState<ContractPaymentPage> createState() =>
      _ContractPaymentPageState();
}

class _ContractPaymentPageState extends ConsumerState<ContractPaymentPage> {
  final _bankNameController = TextEditingController();
  final _bankAccountNameController = TextEditingController();
  final _bankAccountNumberController = TextEditingController();
  final _nominalController = TextEditingController();

  File? _proofFile;

  final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _gold = Color(0xFFD3AB35);
  static const _pageBackground = Color(0xFFF5F0E6);

  @override
  void dispose() {
    _bankNameController.dispose();
    _bankAccountNameController.dispose();
    _bankAccountNumberController.dispose();
    _nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(contractPaymentControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        ToastUtil.showError(
          context,
          title: 'Gagal',
          description: error is Failure ? error.message : error.toString(),
        );
      }
    });

    final contractState =
        ref.watch(contractDetailControllerProvider(widget.contractId));

    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Pembayaran Kontrak',
              subtitle: 'Upload bukti pembayaran',
            ),
            Expanded(
              child: contractState.when(
                data: (contract) {
                  return _buildForm(context, contract);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => _buildError(context, error),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, Contract contract) {
    final colorScheme = Theme.of(context).colorScheme;
    final paymentState = ref.watch(contractPaymentControllerProvider);
    final isLoading = paymentState.isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPaymentSummaryHero(contract),
          const SizedBox(height: 18),
          _buildSectionTitle(context, 'DATA REKENING PENGIRIM'),
          const SizedBox(height: 12),
          _buildCard(
            context,
            children: [
              AppTextField(
                label: 'Nama Bank',
                controller: _bankNameController,
                enabled: !isLoading,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Atas Nama',
                controller: _bankAccountNameController,
                enabled: !isLoading,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Nomor Rekening',
                controller: _bankAccountNumberController,
                enabled: !isLoading,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const SizedBox(height: 18),
          _buildSectionTitle(context, 'BUKTI PEMBAYARAN'),
          const SizedBox(height: 12),
          _buildCard(
            context,
            children: [
              AppTextField(
                label: 'Nominal',
                controller: _nominalController,
                enabled: !isLoading,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.payments_outlined),
              ),
              const SizedBox(height: 16),
              AppFilePickerField(
                key: ValueKey(_proofFile?.path ?? 'payment_proof_empty'),
                label: 'Bukti Transfer',
                allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
                initialFile: _proofFile,
                onFileSelected: (file) {
                  setState(() => _proofFile = file);
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Format: JPG, PNG, atau PDF. Ukuran maksimal mengikuti ketentuan server.',
                style: AppTextStyles.body(
                  fontSize: 12,
                  height: 1.4,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            label: 'Upload Bukti Pembayaran',
            isLoading: isLoading,
            onPressed: isLoading ? null : () => _handleSubmit(contract),
            icon: const Icon(Icons.upload_file_rounded),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildPaymentSummaryHero(Contract contract) {
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
                      'Total Pembayaran',
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
                        _currencyFormat.format(contract.cowTotalPrice ?? 0),
                        style: AppTextStyles.title(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      contract.contractNumber ?? 'Kontrak',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        color: Colors.white.withValues(alpha: 0.72),
                        fontSize: 12,
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
                  label: 'Jumlah Sapi',
                  value: '${contract.cowQuantity ?? 0} Ekor',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryMetric(
                  label: 'Harga/Ekor',
                  value: _currencyFormat.format(contract.cowPrice ?? 0),
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

  Widget _buildCard(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    final message =
        error is Failure ? error.message : 'Gagal mendapatkan detail kontrak';

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
            ],
          ),
        ),
      ),
    );
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

  Future<void> _handleSubmit(Contract contract) async {
    final file = _proofFile;
    final nominal = double.tryParse(_nominalController.text.trim());

    if (_bankNameController.text.trim().isEmpty ||
        _bankAccountNameController.text.trim().isEmpty ||
        _bankAccountNumberController.text.trim().isEmpty ||
        nominal == null ||
        nominal <= 0 ||
        file == null) {
      ToastUtil.showError(
        context,
        title: 'Data belum lengkap',
        description: 'Lengkapi data rekening, nominal, dan bukti pembayaran.',
      );
      return;
    }

    final result = await ref
        .read(contractPaymentControllerProvider.notifier)
        .uploadPaymentProof(
          contractId: contract.id,
          request: StorePaymentProofRequestDto(
            file: file,
            bankName: _bankNameController.text.trim(),
            bankAccountName: _bankAccountNameController.text.trim(),
            bankAccountNumber: _bankAccountNumberController.text.trim(),
            nominal: nominal,
          ),
        );

    if (result == null || !mounted) return;

    ref.invalidate(contractDetailControllerProvider(widget.contractId));

    ToastUtil.showSuccess(
      context,
      title: 'Berhasil',
      description: 'Bukti pembayaran berhasil diunggah.',
    );

    context.go(Routes.contractDetail.replaceAll(':id', widget.contractId));
  }
}
