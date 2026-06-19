import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/bank_accounts/application/bank_account_create_controller.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
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
  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

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
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Tambah Rekening',
              subtitle: 'Masukkan detail rekening bank baru Anda',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                  child: _buildWhiteCard(
                    context: context,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionTitle(context, 'DATA REKENING'),
                        const SizedBox(height: 16),
                        // Header description
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? _green.withValues(alpha: 0.15)
                                    : _softGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info_outline,
                                color: _green,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Pastikan data akun bank yang Anda masukkan sudah benar untuk kelancaran transaksi.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),

                        AppTextField(
                          controller: _bankNameController,
                          label: 'Nama Bank',
                          prefixIcon: const Icon(Icons.account_balance_outlined,
                              size: 20),
                          textCapitalization: TextCapitalization.characters,
                          errorText: _fieldErrors['bank_name'],
                        ),
                        const SizedBox(height: 24),

                        AppTextField(
                          controller: _accountNameController,
                          label: 'Nama Pemilik Rekening',
                          prefixIcon:
                              const Icon(Icons.person_outline, size: 20),
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
                          prefixIcon:
                              const Icon(Icons.note_alt_outlined, size: 20),
                          errorText: _fieldErrors['note'],
                        ),
                        const SizedBox(height: 24),

                        // Switch for isPrimary
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? _green.withValues(alpha: 0.15)
                                    : _softGreen.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(12),
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
                            activeColor: _gold,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        PrimaryButton(
                          label: 'Simpan',
                          onPressed: isLoading ? null : _handleSubmit,
                          isLoading: isLoading,
                        ),
                      ],
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

  Widget _buildWhiteCard(
      {required BuildContext context, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          style: const TextStyle(
            color: _green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
