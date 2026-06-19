import 'dart:async';

import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/account/bank_accounts/application/bank_accounts_controller.dart';
import 'package:app/features/account/bank_accounts/presentation/widgets/bank_account_card.dart';
import 'package:app/features/account/bank_accounts/presentation/widgets/bank_account_skeleton.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BankAccountsPage extends ConsumerStatefulWidget {
  const BankAccountsPage({super.key});

  @override
  ConsumerState<BankAccountsPage> createState() => _BankAccountsPageState();
}

class _BankAccountsPageState extends ConsumerState<BankAccountsPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  Timer? _debounce;
  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(
      () => setState(() {}),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _searchFocus.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(bankAccountsControllerProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(bankAccountsControllerProvider.notifier).search(query);
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _onSearchChanged('');
    _searchFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bankAccountsControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final hasQuery = _searchController.text.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Rekening Bank',
              subtitle: 'Kelola daftar rekening bank Anda',
            ),
            // Search bar — pill shape
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withValues(alpha: 0.5),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .shadowColor
                                .withValues(alpha: 0.06),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        onChanged: _onSearchChanged,
                        style: AppTextStyles.body(
                          fontSize: 14,
                          color: colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Cari bank atau nama pemilik...',
                          hintStyle: AppTextStyles.body(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.4),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                            color: _green.withValues(alpha: 0.75),
                          ),
                          suffixIcon: hasQuery
                              ? GestureDetector(
                                  onTap: _clearSearch,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: colorScheme.onSurfaceVariant
                                          .withValues(alpha: 0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List
            Expanded(
              child: state.when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  if (data.accounts.isEmpty) {
                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: _buildEmptyState(context,
                              isSearchEmpty: hasQuery),
                        ),
                      ],
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section label
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                        child: Row(
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
                              hasQuery
                                  ? '${data.accounts.length} REKENING DITEMUKAN'
                                  : '${data.accounts.length} REKENING TERSIMPAN',
                              style: AppTextStyles.label(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: _green,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                          itemCount: data.accounts.length +
                              (data.isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < data.accounts.length) {
                              final account = data.accounts[index];
                              return BankAccountCard(
                                account: account,
                                isProcessing:
                                    state.value?.processingId == account.id,
                                onSetPrimary: () => ref
                                    .read(
                                        bankAccountsControllerProvider.notifier)
                                    .setPrimary(account.id),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child: Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
                loading: () => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) => const BankAccountSkeleton(),
                ),
                error: (error, stack) => ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Center(
                        child: _buildWhiteCard(
                          context: context,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.error_outline,
                                  size: 40, color: colorScheme.error),
                              const SizedBox(height: 12),
                              Text(
                                'Gagal memuat data',
                                style: AppTextStyles.body(),
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () => ref
                                    .read(
                                        bankAccountsControllerProvider.notifier)
                                    .refresh(),
                                child: const Text('Coba Lagi'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.bankAccountCreate),
        icon: const Icon(Icons.add_card_outlined),
        label: const Text('Tambah Rekening'),
        backgroundColor: _green,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, {required bool isSearchEmpty}) {
    final colorScheme = Theme.of(context).colorScheme;

    final title =
        isSearchEmpty ? 'Rekening tidak ditemukan' : 'Belum ada rekening bank';
    final subtitle = isSearchEmpty
        ? 'Coba kata kunci lain atau tambah rekening baru'
        : 'Tambahkan rekening bank Anda untuk memudahkan proses penarikan profit.';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildWhiteCard(
          context: context,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? _green.withValues(alpha: 0.15)
                      : _softGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.account_balance_outlined,
                  size: 28,
                  color: _green,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: AppTextStyles.title(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhiteCard(
      {required BuildContext context, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
}
