import 'dart:io';

import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/features/contract/application/contract_draft_controller.dart';
import 'package:app/features/contract/application/contract_list_controller.dart';
import 'package:app/features/contract/data/dtos/requests/save_draft_request_dto.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/features/contract/presentation/widgets/contract_create_skeleton.dart';
import 'package:app/shared/forms/app_dropdown_field.dart';
import 'package:app/shared/forms/app_file_picker_field.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ContractCreatePage extends ConsumerStatefulWidget {
  const ContractCreatePage({super.key});

  @override
  ConsumerState<ContractCreatePage> createState() => _ContractCreatePageState();
}

class _ContractCreatePageState extends ConsumerState<ContractCreatePage> {
  int quantity = 1;
  String selectedCowType = 'Pilih Sapi';
  int? selectedCowId;
  int? selectedCowWeight;
  int currentPrice = 0;
  BankAccount? selectedBankAccount;
  String selectedProgram = 'Reguler';
  String selectedDuration = '12 Bulan';

  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  File? _kycFile;
  bool _isDataPopulated = false;
  bool _isInitialCheckDone = false;
  String? _initialKycFileName;
  ContractStatus? _loadedContractStatus;
  int? _loadedBankAccountId;
  bool _isKycDeleted = false;
  bool isLoading = false;

  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  int get subtotal => quantity * currentPrice;

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(bankAccountsControllerProvider, (previous, next) {
      next.whenData((state) {
        if (selectedBankAccount == null && state.accounts.isNotEmpty) {
          final account = _resolveInitialBankAccount(state.accounts);
          setState(() => selectedBankAccount = account);
        }
      });
    });

    ref.listen(contractDraftControllerProvider, (previous, next) {
      if (!next.isLoading) {
        setState(() => _isInitialCheckDone = true);
      }

      next.whenData((contract) {
        if (contract != null && !_isDataPopulated) {
          _populateContractData(contract);
        }
      });

      if (next is AsyncError) {
        ToastUtil.showError(
          context,
          title: 'Gagal',
          description: next.error.toString(),
        );
      }
    });

    final contractState = ref.watch(contractDraftControllerProvider);
    final isLoading = contractState.isLoading;
    final isInitialLoading = !_isInitialCheckDone && isLoading;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Buat Kontrak Baru',
              subtitle: 'Lengkapi rincian akad kerjasama',
            ),
            if (_isDataPopulated)
              Container(
                margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _editableContractMessage,
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: isInitialLoading
                  ? const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: ContractCreateSkeleton(),
                    )
                  : _buildForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final contractState = ref.watch(contractDraftControllerProvider);
    final isLoading = contractState.isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader(context, 'Data Diri'),
          const SizedBox(height: 12),
          _buildInfoCard(
            context,
            [
              AppTextField(
                label: 'Nama Lengkap',
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                enabled: !isLoading,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'NIK',
                controller: _nikController,
                keyboardType: TextInputType.number,
                enabled: !isLoading,
              ),
              const SizedBox(height: 16),
              AppFilePickerField(
                key: ValueKey('kyc_${_initialKycFileName ?? 'none'}'),
                label: 'KTP',
                allowedExtensions: const ['jpg', 'png', 'pdf'],
                initialValue: _initialKycFileName,
                onFileSelected: (file) {
                  setState(() {
                    _kycFile = file;
                    if (file == null && _initialKycFileName != null) {
                      _isKycDeleted = true;
                    } else if (file != null) {
                      _isKycDeleted = false;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Rincian Kontrak'),
          const SizedBox(height: 12),
          _buildFormCard(context),
          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Program & Durasi'),
          const SizedBox(height: 12),
          _buildProgramCard(context),
          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Ringkasan Pembayaran'),
          const SizedBox(height: 12),
          _buildCalculationCard(context),
          const SizedBox(height: 48),
          SecondaryButton(
            label: 'Simpan Draft',
            isLoading: isLoading,
            onPressed: isLoading ? null : _handleSaveDraft,
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: 'Selanjutnya',
            isLoading: isLoading,
            onPressed: (selectedBankAccount == null || currentPrice == 0)
                ? null
                : _handleSubmit,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  String get _editableContractMessage {
    if (_loadedContractStatus == ContractStatus.rejected) {
      return 'Kontrak Anda ditolak. Silakan perbaiki data sesuai catatan admin.';
    }

    return 'Anda masih memiliki draft kontrak, silakan lanjutkan pengisian.';
  }

  void _populateContractData(Contract contract) {
    _nameController.text = contract.userName ?? '';
    _nikController.text = contract.userIdentityNumber ?? '';
    _initialKycFileName = contract.userIdentityNumberFile?.fileName;
    _loadedContractStatus = contract.status;
    _loadedBankAccountId = contract.bankAccountId;

    if (contract.cowId != null) {
      selectedCowId = contract.cowId;
      selectedCowType = contract.cowName ?? 'Pilih Sapi';
      currentPrice = contract.cowPrice?.toInt() ?? 0;
      selectedCowWeight = contract.cowWeightKg;
      quantity = contract.cowQuantity ?? 1;
    }

    if (contract.program != null) {
      selectedProgram = contract.program!.value;
    }

    if (contract.contractMonthDuration != null) {
      selectedDuration = '${contract.contractMonthDuration} Bulan';
    }

    final bankAccountsState = ref.read(bankAccountsControllerProvider).value;
    if (bankAccountsState != null && bankAccountsState.accounts.isNotEmpty) {
      selectedBankAccount =
          _resolveInitialBankAccount(bankAccountsState.accounts);
    }

    _isDataPopulated = true;
    setState(() {});
  }

  BankAccount _resolveInitialBankAccount(List<BankAccount> accounts) {
    if (_loadedBankAccountId != null) {
      return accounts.firstWhere(
        (account) => account.id == _loadedBankAccountId,
        orElse: () => accounts.firstWhere(
          (account) => account.isPrimary,
          orElse: () => accounts.first,
        ),
      );
    }

    return accounts.firstWhere(
      (account) => account.isPrimary,
      orElse: () => accounts.first,
    );
  }

  Widget _buildProgramCard(BuildContext context) {
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
          AppDropdownField<String>(
            label: 'Pilih Program',
            value: selectedProgram,
            items: const [
              DropdownMenuItem(value: 'Reguler', child: Text('Reguler')),
              DropdownMenuItem(value: 'PPM', child: Text('PPM')),
              DropdownMenuItem(value: 'Umroh', child: Text('Umroh')),
            ],
            onChanged: (val) {
              if (val != null) setState(() => selectedProgram = val);
            },
          ),
          const SizedBox(height: 24),
          AppDropdownField<String>(
            label: 'Durasi Kontrak',
            value: selectedDuration,
            items: const [
              DropdownMenuItem(value: '12 Bulan', child: Text('12 Bulan')),
              DropdownMenuItem(value: '36 Bulan', child: Text('36 Bulan')),
            ],
            onChanged: (val) {
              if (val != null) setState(() => selectedDuration = val);
            },
          ),
        ],
      ),
    );
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

  Widget _buildInfoCard(BuildContext context, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
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
          Text(
            'Jenis Sapi',
            style: AppTextStyles.body(
              color: colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final result = await context.push(Routes.cowCatalog);
              if (result != null && result is Map<String, dynamic>) {
                setState(() {
                  selectedCowId = result['id'] as int;
                  selectedCowType = result['name'] as String;
                  currentPrice = result['price'] as int;
                  selectedCowWeight = result['weight_kg'] as int;
                });
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color:
                    colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outline),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedCowType,
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 14, color: colorScheme.onSurfaceVariant),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Jumlah Sapi',
            style: AppTextStyles.body(
              color: colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCounterButton(context, Icons.remove, () {
                if (quantity > 1) setState(() => quantity--);
              }),
              SizedBox(
                width: 60,
                child: Text(
                  quantity.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              _buildCounterButton(context, Icons.add, () {
                setState(() => quantity++);
              }),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Rekening Pembayaran',
            style: AppTextStyles.body(
              color: colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          _buildBankAccountSelector(context),
        ],
      ),
    );
  }

  Widget _buildBankAccountSelector(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bankAccountsAsync = ref.watch(bankAccountsControllerProvider);

    return bankAccountsAsync.when(
      data: (state) {
        if (state.accounts.isEmpty) {
          return InkWell(
            onTap: () => context.push(Routes.bankAccountCreate),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.1),
                border: Border.all(
                  color: Colors.amber.withValues(alpha: 0.3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.amber, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Belum ada rekening. Tambah sekarang?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange.shade900,
                      ),
                    ),
                  ),
                  const Icon(Icons.add_circle_outline,
                      color: Colors.amber, size: 20),
                ],
              ),
            ),
          );
        }

        return InkWell(
          onTap: () => _showBankAccountPicker(context, state.accounts),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.account_balance_rounded,
                      size: 16, color: colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedBankAccount?.bankName ?? 'Pilih Rekening',
                        style: AppTextStyles.body(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (selectedBankAccount != null)
                        Text(
                          selectedBankAccount!.accountNumber,
                          style: AppTextStyles.body(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded,
                    color: colorScheme.onSurfaceVariant),
              ],
            ),
          ),
        );
      },
      loading: () => Container(
        height: 54,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  void _showBankAccountPicker(
      BuildContext context, List<BankAccount> accounts) {
    final colorScheme = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pilih Rekening Pembayaran',
                style: AppTextStyles.title(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    final isSelected = selectedBankAccount?.id == account.id;

                    return InkWell(
                      onTap: () {
                        setState(() => selectedBankAccount = account);
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.outlineVariant,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: isSelected
                              ? colorScheme.primary.withValues(alpha: 0.05)
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerLowest,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.account_balance_wallet_outlined,
                                  color: colorScheme.primary),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    account.bankName,
                                    style: AppTextStyles.body(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${account.accountNumber} • ${account.accountName}',
                                    style: AppTextStyles.body(
                                        fontSize: 12,
                                        color: colorScheme.onSurfaceVariant),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle_rounded,
                                  color: colorScheme.primary),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCounterButton(
      BuildContext context, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget _buildCalculationCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCalcRow(
            context,
            'Harga Satuan',
            currencyFormat.format(currentPrice),
          ),
          const SizedBox(height: 12),
          _buildCalcRow(context, 'Jumlah', '$quantity Ekor'),
          Divider(height: 24, color: colorScheme.outline),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                currencyFormat.format(subtotal),
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalcRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.body(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Future<void> _handleSaveDraft() async {
    setState(() => isLoading = true);
    final success = await _saveProcess();
    setState(() => isLoading = false);

    if (success && mounted) {
      ToastUtil.showSuccess(
        context,
        title: 'Berhasil',
        description: 'Draft kontrak berhasil disimpan',
      );
    }
  }

  Future<void> _handleSubmit() async {
    setState(() => isLoading = true);
    final success = await _saveProcess();
    setState(() => isLoading = false);

    if (success && mounted) {
      context.push(Routes.contractPreview);
    }
  }

  Future<bool> _saveProcess() async {
    final dto = SaveDraftRequestDto(
      userName: _nameController.text,
      userIdentityNumber: _nikController.text,
      userIdentityNumberFile: _kycFile,
      cowId: selectedCowId,
      cowQuantity: quantity,
      cowTotalPrice: subtotal.toDouble(),
      bankAccountId: selectedBankAccount?.id,
      program: selectedProgram,
      contractMonthDuration: int.tryParse(selectedDuration.split(' ')[0]),
      deleteUserIdentityNumberFile: _isKycDeleted,
    );

    final result =
        await ref.read(contractDraftControllerProvider.notifier).saveDraft(dto);

    if (result != null) {
      ref.invalidate(contractListControllerProvider);
      return true;
    }
    return false;
  }
}
