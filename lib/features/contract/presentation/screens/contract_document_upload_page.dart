import 'dart:io';

import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/contract/application/contract_detail_controller.dart';
import 'package:app/features/contract/application/contract_document_controller.dart';
import 'package:app/features/contract/data/dtos/requests/upload_contract_document_request_dto.dart';
import 'package:app/shared/forms/app_file_picker_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContractDocumentUploadPage extends ConsumerStatefulWidget {
  final String contractId;

  const ContractDocumentUploadPage({
    super.key,
    required this.contractId,
  });

  @override
  ConsumerState<ContractDocumentUploadPage> createState() =>
      _ContractDocumentUploadPageState();
}

class _ContractDocumentUploadPageState
    extends ConsumerState<ContractDocumentUploadPage> {
  File? _contractFile;

  static const _green = Color(0xFF1F6E2D);
  static const _pageBackground = Color(0xFFF5F0E6);

  @override
  Widget build(BuildContext context) {
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
    final isLoading = documentState.isLoading;

    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Upload Kontrak',
              subtitle: 'Dokumen kontrak yang sudah ditandatangani',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildUploadCard(context, isLoading),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: 'Upload',
                      isLoading: isLoading,
                      onPressed: isLoading ? null : _handleSubmit,
                      icon: const Icon(Icons.upload_file_rounded),
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

  Widget _buildUploadCard(BuildContext context, bool isLoading) {
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
                  color: _green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'DOKUMEN KONTRAK',
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
          const SizedBox(height: 16),
          AbsorbPointer(
            absorbing: isLoading,
            child: AppFilePickerField(
              key: ValueKey(_contractFile?.path ?? 'contract_document_empty'),
              label: 'File Kontrak',
              allowedExtensions: const ['pdf'],
              initialFile: _contractFile,
              onFileSelected: (file) {
                setState(() => _contractFile = file);
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Format: PDF.',
            style: AppTextStyles.body(
              fontSize: 12,
              height: 1.4,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final contractId = int.tryParse(widget.contractId);
    final file = _contractFile;

    if (contractId == null || contractId <= 0) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'ID kontrak tidak valid.',
      );
      return;
    }

    if (file == null) {
      ToastUtil.showWarning(
        context,
        title: 'File belum dipilih',
        description: 'Pilih file kontrak terlebih dahulu.',
      );
      return;
    }

    final message = await ref
        .read(contractDocumentControllerProvider.notifier)
        .uploadContractDocument(
          contractId: contractId,
          request: UploadContractDocumentRequestDto(file: file),
        );

    if (!mounted || message == null) return;

    ref.invalidate(contractDetailControllerProvider(widget.contractId));
    ToastUtil.showSuccess(
      context,
      title: 'Berhasil',
      description: message,
    );
    context.pop();
  }
}
