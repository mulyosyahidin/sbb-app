import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/bank_accounts/application/bank_account_create_controller.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BankAccountCreatePage extends ConsumerStatefulWidget {
  const BankAccountCreatePage({super.key});

  @override
  ConsumerState<BankAccountCreatePage> createState() =>
      _BankAccountCreatePageState();
}

class _BankAccountCreatePageState extends ConsumerState<BankAccountCreatePage> {
  final _bankNameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _noteController = TextEditingController();
  bool _isPrimary = false;

  Map<String, String> _fieldErrors = {};

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _fieldErrors = {});

    // Basic client-side validation
    if (_bankNameController.text.isEmpty ||
        _accountNameController.text.isEmpty ||
        _accountNumberController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Mohon isi semua bidang yang wajib diisi',
      );
      return;
    }

    ref.read(bankAccountCreateControllerProvider.notifier).create(
          bankName: _bankNameController.text,
          accountName: _accountNameController.text,
          accountNumber: _accountNumberController.text,
          note: _noteController.text,
          isPrimary: _isPrimary,
        );
  }

  @override
  Widget build(BuildContext context) {
    final createStatus = ref.watch(bankAccountCreateControllerProvider);
    final isLoading = createStatus is AsyncLoading;

    ref.listen(bankAccountCreateControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is ValidationFailure) {
          setState(() {
            _fieldErrors = error.errors ?? {};
          });
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
          !next.isLoading &&
          previous is AsyncLoading) {
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: 'Akun bank berhasil ditambahkan',
        );
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Akun Bank'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.1),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Pastikan data akun bank yang Anda masukkan sudah benar untuk kelancaran transaksi.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              AppTextField(
                controller: _bankNameController,
                label: 'Nama Bank',
                prefixIcon:
                    const Icon(Icons.account_balance_outlined, size: 20),
                textCapitalization: TextCapitalization.characters,
                errorText: _fieldErrors['bank_name'],
              ),
              const SizedBox(height: 24),

              AppTextField(
                controller: _accountNameController,
                label: 'Nama Pemilik Rekening',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
                errorText: _fieldErrors['account_name'],
              ),
              const SizedBox(height: 24),

              AppTextField(
                controller: _accountNumberController,
                label: 'Nomor Rekening',
                prefixIcon: const Icon(Icons.numbers, size: 20),
                keyboardType: TextInputType.number,
                errorText: _fieldErrors['account_number'],
              ),
              const SizedBox(height: 24),

              AppTextField(
                controller: _noteController,
                label: 'Catatan (Opsional)',
                prefixIcon: const Icon(Icons.note_alt_outlined, size: 20),
                errorText: _fieldErrors['note'],
              ),
              const SizedBox(height: 24),

              // Switch for isPrimary
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: SwitchListTile(
                  value: _isPrimary,
                  onChanged: (value) {
                    setState(() => _isPrimary = value);
                  },
                  title: const Text(
                    'Jadikan Akun Utama',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Tandai rekening ini sebagai rekening utama untuk menerima pembayaran',
                    style: TextStyle(fontSize: 12),
                  ),
                  secondary: Icon(
                    _isPrimary ? Icons.star : Icons.star_border,
                    color: _isPrimary ? AppColors.warning : null,
                  ),
                  activeColor: AppColors.warning,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              PrimaryButton(
                label: 'Simpan',
                onPressed: isLoading ? null : _handleSubmit,
                isLoading: isLoading,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
