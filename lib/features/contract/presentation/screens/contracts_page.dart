import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/application/contract_list_controller.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_card/draft_contract_card_partial.dart';
import 'package:app/features/contract/presentation/widgets/contract_card.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ContractsPage extends ConsumerStatefulWidget {
  const ContractsPage({super.key});

  @override
  ConsumerState<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends ConsumerState<ContractsPage> {
  String selectedFilter = 'Semua';
  final filters = ['Semua', 'Draft', 'Aktif', 'Selesai'];
  late final ScrollController _scrollController;

  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(contractListControllerProvider(selectedFilter).notifier)
          .loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final contractState =
        ref.watch(contractListControllerProvider(selectedFilter));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(contractState.value?.pagination?.total ?? 0),
              _buildFilters(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ref
                      .read(contractListControllerProvider(selectedFilter)
                          .notifier)
                      .refresh(),
                  child: contractState.when(
                    skipLoadingOnRefresh: false,
                    data: (state) {
                      if (state.contracts.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.58,
                              child: _buildEmptyState(context),
                            ),
                          ],
                        );
                      }

                      return ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.contracts.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.contracts.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          return _buildContractCard(state.contracts[index]);
                        },
                      );
                    },
                    loading: () => const _ContractListSkeleton(),
                    error: (error, stack) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Gagal memuat data: $error'),
                                TextButton(
                                  onPressed: () => ref
                                      .read(contractListControllerProvider(
                                              selectedFilter)
                                          .notifier)
                                      .refresh(),
                                  child: const Text('Coba Lagi'),
                                ),
                              ],
                            ),
                          ),
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
    );
  }

  Widget _buildHeader(int totalCount) {
    return AppBarHeader(
      title: 'Daftar Kontrak',
      subtitle: '$totalCount kontrak terdaftar',
      titleColor: AppColors.textPrimaryLight,
      subtitleColor: AppColors.textSecondaryLight,
      trailing: InkWell(
        onTap: () => context.push(Routes.contractCreate),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primary, // Primary green from theme
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isAllFilter = selectedFilter == 'Semua';
    final subtitle = isAllFilter
        ? 'Mulai kontrak pertama untuk mencatat investasi, modal, dan masa kontrak dalam satu tempat.'
        : 'Tidak ada kontrak dengan status $selectedFilter saat ini. Coba status lain atau buat kontrak baru.';

    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.75),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 66,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: 0.28),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 31,
                    child: Container(
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.42),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 43,
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.28),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 13,
                    bottom: 13,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Belum ada kontrak',
              textAlign: TextAlign.center,
              style: AppTextStyles.title(
                color: colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.body(
                fontSize: 13,
                height: 1.5,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => setState(() => selectedFilter = filter),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Center(
                  child: Text(
                    filter,
                    style: AppTextStyles.body(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContractCard(Contract contract) {
    switch (contract.status) {
      case ContractStatus.draft:
        return DraftContractCardPartial(contract: contract);
      case ContractStatus.waitingVerification:
      case ContractStatus.waitingPaymentVerification:
      case ContractStatus.waitingPayment:
      case ContractStatus.paymentRejected:
      case ContractStatus.active:
      case ContractStatus.extended:
      case ContractStatus.completed:
      case ContractStatus.cancelled:
      case ContractStatus.rejected:
        return ContractCard(item: contract);
    }
  }
}

class _ContractListSkeleton extends StatelessWidget {
  const _ContractListSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (context, index) => const _ContractCardSkeleton(),
    );
  }
}

class _ContractCardSkeleton extends StatelessWidget {
  const _ContractCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Skeleton(height: 18, borderRadius: 6),
                ),
                SizedBox(width: 40),
                Skeleton(width: 84, height: 24, borderRadius: 12),
              ],
            ),
            SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _ContractDetailSkeleton(labelWidth: 36),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: _ContractDetailSkeleton(labelWidth: 44),
                ),
              ],
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(width: 88, height: 12, borderRadius: 6),
                Skeleton(width: 150, height: 12, borderRadius: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContractDetailSkeleton extends StatelessWidget {
  final double labelWidth;

  const _ContractDetailSkeleton({
    required this.labelWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton(width: labelWidth, height: 11, borderRadius: 6),
        const SizedBox(height: 6),
        const Skeleton(height: 15, borderRadius: 6),
      ],
    );
  }
}
