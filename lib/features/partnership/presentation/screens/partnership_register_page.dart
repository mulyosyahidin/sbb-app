import 'dart:io';

import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/partnership/application/partnership_controller.dart';
import 'package:app/features/partnership/domain/entities/partnership_application.dart';
import 'package:app/shared/forms/app_file_picker_field.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_textarea_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PartnershipRegisterPage extends ConsumerStatefulWidget {
  final PartnershipApplication? initialApplication;

  const PartnershipRegisterPage({
    super.key,
    this.initialApplication,
  });

  @override
  ConsumerState<PartnershipRegisterPage> createState() =>
      _PartnershipRegisterPageState();
}

class _PartnershipRegisterPageState
    extends ConsumerState<PartnershipRegisterPage> {
  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  final _addressController = TextEditingController();
  final _levelController = TextEditingController();

  int? _selectedLevel;
  File? _identityCardFile;
  Map<String, String> _fieldErrors = {};
  bool _hasSubmitted = false;

  static const _softGreen = Color(0xFFE9F6DF);

  static const _levels = [
    _PartnershipLevelOption(value: 1, label: 'Mitra'),
    _PartnershipLevelOption(value: 2, label: 'Konsultan'),
    _PartnershipLevelOption(value: 3, label: 'Mitra Konsultan'),
  ];

  bool get _isUpdateMode => widget.initialApplication != null;

  @override
  void initState() {
    super.initState();

    final application = widget.initialApplication;
    if (application == null) return;

    _nameController.text = application.name;
    _nikController.text = application.nik;
    _addressController.text = application.address;
    _levelController.text = application.toLevelLabel;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _addressController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _fieldErrors = {});

    if ((!_isUpdateMode && _selectedLevel == null) ||
        _nameController.text.trim().isEmpty ||
        _nikController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty ||
        (!_isUpdateMode && _identityCardFile == null)) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Mohon isi semua bidang yang wajib diisi',
      );
      return;
    }

    if (_nikController.text.trim().length != 16) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'NIK harus tepat 16 digit',
      );
      return;
    }

    final notifier =
        ref.read(partnershipApplicationCreateControllerProvider.notifier);

    _hasSubmitted = true;

    if (_isUpdateMode) {
      notifier.updateApplication(
        id: widget.initialApplication!.id,
        name: _nameController.text.trim(),
        nik: _nikController.text.trim(),
        address: _addressController.text.trim(),
        identityCardFile: _identityCardFile,
      );
    } else {
      notifier.create(
        level: _selectedLevel!,
        name: _nameController.text.trim(),
        nik: _nikController.text.trim(),
        address: _addressController.text.trim(),
        identityCardFile: _identityCardFile!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final createState =
        ref.watch(partnershipApplicationCreateControllerProvider);
    final isLoading = createState is AsyncLoading;

    ref.listen(partnershipApplicationCreateControllerProvider,
        (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is ValidationFailure) {
          setState(() => _fieldErrors = error.errors ?? {});
          ToastUtil.showError(
            context,
            title: 'Terjadi Kesalahan',
            description: error.message,
          );
        } else if (error is Failure) {
          ToastUtil.showError(
            context,
            title: 'Gagal',
            description: error.message,
          );
        } else {
          ToastUtil.showError(
            context,
            title: 'Gagal',
            description: error.toString(),
          );
        }
      } else if (next is AsyncData &&
          _hasSubmitted &&
          !next.isLoading &&
          previous is AsyncLoading) {
        _hasSubmitted = false;
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: _isUpdateMode
              ? 'Perbaikan pengajuan berhasil dikirim'
              : 'Pengajuan kemitraan berhasil dikirim',
        );
        context.pop();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Form Kemitraan',
              subtitle: 'Lengkapi data pengajuan Anda',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1F6E2D).withValues(alpha: 0.15)
                              : _softGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline, size: 20),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Pastikan data yang dikirim sesuai dengan identitas resmi Anda.',
                                style: TextStyle(fontSize: 13, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (_isUpdateMode)
                        AppTextField(
                          controller: _levelController,
                          label: 'Level Kemitraan',
                          prefixIcon:
                              const Icon(Icons.workspace_premium_outlined),
                          readOnly: true,
                        )
                      else
                        _PartnershipLevelPicker(
                          levels: _levels,
                          selectedLevel: _selectedLevel,
                          errorText: _fieldErrors['level'],
                          onChanged: (value) {
                            setState(() => _selectedLevel = value);
                          },
                        ),
                      const SizedBox(height: 22),
                      AppTextField(
                        controller: _nameController,
                        label: 'Nama Lengkap',
                        prefixIcon: const Icon(Icons.person_outline),
                        textCapitalization: TextCapitalization.words,
                        errorText: _fieldErrors['name'],
                      ),
                      const SizedBox(height: 22),
                      AppTextField(
                        controller: _nikController,
                        label: 'NIK',
                        prefixIcon: const Icon(Icons.badge_outlined),
                        keyboardType: TextInputType.number,
                        errorText: _fieldErrors['nik'],
                      ),
                      const SizedBox(height: 22),
                      AppTextAreaField(
                        controller: _addressController,
                        label: 'Alamat',
                        minLines: 3,
                        errorText: _fieldErrors['address'],
                      ),
                      const SizedBox(height: 22),
                      AppFilePickerField(
                        label: 'File KTP',
                        allowedExtensions: const ['pdf', 'jpg', 'jpeg'],
                        initialValue: widget
                            .initialApplication?.identityCardFile?.fileName,
                        onFileSelected: (file) {
                          setState(() => _identityCardFile = file);
                        },
                      ),
                      if (_fieldErrors['identity_card_file'] != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          _fieldErrors['identity_card_file']!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ],
                      const SizedBox(height: 28),
                      PrimaryButton(
                        label: _isUpdateMode
                            ? 'Kirim Perbaikan'
                            : 'Kirim Pengajuan',
                        icon: const Icon(Icons.send_outlined),
                        isLoading: isLoading,
                        onPressed: isLoading ? null : _handleSubmit,
                      ),
                    ],
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

class _PartnershipLevelPicker extends StatelessWidget {
  final List<_PartnershipLevelOption> levels;
  final int? selectedLevel;
  final ValueChanged<int> onChanged;
  final String? errorText;

  const _PartnershipLevelPicker({
    required this.levels,
    required this.selectedLevel,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'LEVEL KEMITRAAN',
          style: TextStyle(
            color: colorScheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            for (final level in levels) ...[
              Expanded(
                child: _PartnershipLevelChip(
                  label: level.label,
                  isSelected: selectedLevel == level.value,
                  onTap: () => onChanged(level.value),
                ),
              ),
              if (level != levels.last) const SizedBox(width: 8),
            ],
          ],
        ),
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText!,
            style: TextStyle(
              color: colorScheme.error,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}

class _PartnershipLevelChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PartnershipLevelChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = isSelected
        ? colorScheme.primary
        : colorScheme.primaryContainer.withValues(alpha: 0.1);
    final foregroundColor =
        isSelected ? colorScheme.onPrimary : colorScheme.onSurface;
    final borderColor = isSelected ? colorScheme.primary : colorScheme.outline;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),
      ),
    );
  }
}

class _PartnershipLevelOption {
  final int value;
  final String label;

  const _PartnershipLevelOption({
    required this.value,
    required this.label,
  });
}
