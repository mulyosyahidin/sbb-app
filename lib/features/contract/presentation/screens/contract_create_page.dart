import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/forms/app_choice_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import 'package:app/features/partner/application/partner_controller.dart';
import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/domain/entities/bank_account.dart';
import 'package:app/features/partner/domain/entities/partner.dart';
import 'package:app/features/partner/presentation/widgets/partner_skeleton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractCreatePage extends ConsumerStatefulWidget {
  const ContractCreatePage({super.key});

  @override
  ConsumerState<ContractCreatePage> createState() => _ContractCreatePageState();
}

class _ContractCreatePageState extends ConsumerState<ContractCreatePage> {
  int quantity = 1;
  String selectedCowType = 'Brahman Cross';
  int currentPrice = 18000000;
  BankAccount? selectedBankAccount;
  String selectedProgram = 'Regular';
  String selectedDuration = '12 Bulan';

  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  int get subtotal => quantity * currentPrice;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final partnerAsync = ref.watch(partnerControllerProvider);

    ref.listen(bankAccountsControllerProvider, (previous, next) {
      next.whenData((state) {
        if (selectedBankAccount == null && state.accounts.isNotEmpty) {
          final primary = state.accounts.firstWhere((a) => a.isPrimary,
              orElse: () => state.accounts.first);
          setState(() => selectedBankAccount = primary);
        }
      });
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Buat Kontrak Baru',
              subtitle: 'Lengkapi rincian akad kerjasama',
            ),
            Expanded(
              child: partnerAsync.when(
                data: (partner) {
                  if (partner == null) {
                    return _buildBecomePartnerState(context);
                  }
                  return _buildForm(context, partner);
                },
                loading: () => const PartnerSkeleton(),
                error: (error, stack) => _buildErrorState(context, error),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, Partner partner) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader(context, 'Informasi Mitra'),
          const SizedBox(height: 12),
          _buildInfoCard(
            context,
            [
              _buildReadOnlyField(context, 'Nama Lengkap', partner.name),
              const SizedBox(height: 16),
              _buildReadOnlyField(context, 'NIK', partner.nik),
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
          PrimaryButton(
            label: 'Submit Kontrak',
            onPressed: selectedBankAccount == null
                ? null
                : () {
                    final data = {
                      'partner': partner,
                      'quantity': quantity,
                      'cowType': selectedCowType,
                      'price': currentPrice,
                      'bankAccount': selectedBankAccount,
                      'program': selectedProgram,
                      'duration': selectedDuration,
                      'subtotal': subtotal,
                    };
                    context.push(Routes.contractPreview, extra: data);
                  },
          ),
          const SizedBox(height: 40),
        ],
      ),
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
          AppChoiceField<String>(
            label: 'Pilih Program',
            options: const [
              ChoiceOption(label: 'Regular', value: 'Regular'),
              ChoiceOption(label: 'PPM', value: 'PPM'),
              ChoiceOption(label: 'Umroh', value: 'Umroh'),
            ],
            selected: selectedProgram,
            onSelected: (val) => setState(() => selectedProgram = val),
          ),
          const SizedBox(height: 24),
          AppChoiceField<String>(
            label: 'Durasi Kontrak',
            options: const [
              ChoiceOption(label: '12 Bulan', value: '12 Bulan'),
              ChoiceOption(label: '36 Bulan', value: '36 Bulan'),
            ],
            selected: selectedDuration,
            onSelected: (val) => setState(() => selectedDuration = val),
          ),
        ],
      ),
    );
  }

  Widget _buildBecomePartnerState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.handshake_outlined,
              size: 36,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Hanya untuk Mitra',
            style: AppTextStyles.heading(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Anda harus terdaftar sebagai mitra untuk dapat membuat kontrak kerjasama investasi.',
            style: AppTextStyles.body(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            label: 'DAFTAR MITRA SEKARANG',
            onPressed: () => context.push(Routes.openPartner),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Gagal mengambil data mitra', style: AppTextStyles.title()),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.body(),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Coba Lagi',
              onPressed: () => ref.refresh(partnerControllerProvider),
            ),
          ],
        ),
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

  Widget _buildReadOnlyField(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
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
                  selectedCowType = result['name'] as String;
                  currentPrice = result['price'] as int;
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
                border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
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

  void _showBankAccountPicker(BuildContext context, List<BankAccount> accounts) {
    final colorScheme = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCalcRow(
              context, 'Harga Satuan', currencyFormat.format(currentPrice)),
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
}
