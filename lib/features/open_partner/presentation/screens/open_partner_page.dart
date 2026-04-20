import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/shared/forms/app_dropdown_field.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OpenPartnerPage extends ConsumerStatefulWidget {
  const OpenPartnerPage({super.key});

  @override
  ConsumerState<OpenPartnerPage> createState() => _OpenPartnerPageState();
}

class _OpenPartnerPageState extends ConsumerState<OpenPartnerPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _alamatController = TextEditingController();
  final _phoneController = TextEditingController();
  final _sapiController = TextEditingController();
  final _nominalController = TextEditingController();

  BankAccount? _selectedBankAccount;
  DateTime? _tanggalBergabung;
  String? _selectedProgram;
  String _selectedKontrak = '12 bulan';

  final List<String> _programs = ['Umroh', 'Regular', 'PPM'];
  final List<String> _kontrakOptions = ['12 bulan', '36 bulan'];

  @override
  void dispose() {
    _namaController.dispose();
    _nikController.dispose();
    _alamatController.dispose();
    _phoneController.dispose();
    _sapiController.dispose();
    _nominalController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalBergabung ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _tanggalBergabung) {
      setState(() {
        _tanggalBergabung = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bankAccountsState = ref.watch(bankAccountsControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Buka Kemitraan',
              subtitle: 'Form pendaftaran mitra baru',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextField(
                        label: 'Nama',
                        controller: _namaController,
                        hint: 'Masukkan nama lengkap',
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'NIK',
                        controller: _nikController,
                        hint: 'Masukkan nomor NIK',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Alamat',
                        controller: _alamatController,
                        hint: 'Masukkan alamat lengkap',
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Nomor Telepon',
                        controller: _phoneController,
                        hint: 'Masukkan nomor telepon',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      bankAccountsState.when(
                        data: (state) => AppDropdownField<BankAccount>(
                          label: 'Rekening',
                          hint: 'Pilih rekening',
                          value: _selectedBankAccount,
                          items: state.accounts.map((account) {
                            return DropdownMenuItem(
                              value: account,
                              child: Text(
                                '${account.bankName} - ${account.accountNumber}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedBankAccount = value;
                            });
                          },
                        ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, _) =>
                            Text('Gagal memuat rekening: $error'),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TANGGAL BERGABUNG',
                            style: AppTextStyles.label(
                              color: colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: colorScheme.outlineVariant),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined,
                                      size: 20, color: colorScheme.primary),
                                  const SizedBox(width: 12),
                                  Text(
                                    _tanggalBergabung == null
                                        ? 'Pilih tanggal'
                                        : DateFormat('dd MMMM yyyy')
                                            .format(_tanggalBergabung!),
                                    style: AppTextStyles.body(
                                      fontWeight: FontWeight.w500,
                                      color: _tanggalBergabung == null
                                          ? colorScheme.onSurfaceVariant
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Jumlah Ekor Sapi',
                        controller: _sapiController,
                        hint: 'Masukkan jumlah ekor sapi',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Nominal (Rp)',
                        controller: _nominalController,
                        hint: 'Masukkan nominal',
                        keyboardType: TextInputType.number,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Rp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppDropdownField<String>(
                        label: 'Program',
                        hint: 'Pilih program',
                        value: _selectedProgram,
                        items: _programs.map((program) {
                          return DropdownMenuItem(
                            value: program,
                            child: Text(program),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedProgram = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'KONTRAK',
                            style: AppTextStyles.label(
                              color: colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ..._kontrakOptions
                              .map((option) => RadioListTile<String>(
                                    title: Text(
                                      option,
                                      style: AppTextStyles.body(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    value: option,
                                    groupValue: _selectedKontrak,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedKontrak = value!;
                                      });
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                  )),
                        ],
                      ),
                      const SizedBox(height: 32),
                      PrimaryButton(
                        onPressed: () {
                          // Dummy action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Form disubmit (Dummy)')),
                          );
                        },
                        label: 'SUBMIT',
                      ),
                      const SizedBox(height: 40),
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
