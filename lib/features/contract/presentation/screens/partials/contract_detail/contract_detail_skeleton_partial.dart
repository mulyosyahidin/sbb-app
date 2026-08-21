import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class ContractDetailSkeletonPartial extends StatelessWidget {
  final ContractStatus? status;

  const ContractDetailSkeletonPartial({
    super.key,
    this.status,
  });

  static const _activeBackground = Color(0xFFF5F0E6);

  @override
  Widget build(BuildContext context) {
    final isActiveLayout = status == ContractStatus.active ||
        status == ContractStatus.extended ||
        status == ContractStatus.completed;

    return Scaffold(
      backgroundColor: isActiveLayout
          ? _activeBackground
          : Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: _subtitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: isActiveLayout
                    ? const EdgeInsets.fromLTRB(16, 18, 16, 28)
                    : const EdgeInsets.all(24),
                child: _buildContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _subtitle {
    switch (status) {
      case ContractStatus.waitingVerification:
        return 'Menunggu Verifikasi';
      case ContractStatus.waitingPaymentVerification:
        return 'Menunggu Verifikasi Pembayaran';
      case ContractStatus.waitingPayment:
        return 'Menunggu Pembayaran';
      case ContractStatus.paymentRejected:
        return 'Pembayaran Ditolak';
      case ContractStatus.active:
        return 'Aktif';
      case ContractStatus.extended:
        return 'Diperpanjang';
      case ContractStatus.completed:
        return 'Selesai';
      case ContractStatus.cancelled:
        return 'Dibatalkan';
      case ContractStatus.rejected:
        return 'Ditolak';
      case ContractStatus.draft:
      case null:
        return 'Memuat data kontrak';
    }
  }

  Widget _buildContent(BuildContext context) {
    switch (status) {
      case ContractStatus.active:
      case ContractStatus.extended:
      case ContractStatus.completed:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ActiveHeroSkeleton(),
            SizedBox(height: 18),
            _SectionCardSkeleton(rowCount: 8),
            SizedBox(height: 12),
            _SectionCardSkeleton(rowCount: 5),
            SizedBox(height: 12),
            _SectionCardSkeleton(rowCount: 3),
            SizedBox(height: 16),
            _ActionRowSkeleton(),
          ],
        );
      case ContractStatus.waitingPayment:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MessageSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 180),
            SizedBox(height: 12),
            _PaymentSummarySkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 160),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 6),
            SizedBox(height: 32),
            _ButtonSkeleton(),
          ],
        );
      case ContractStatus.waitingPaymentVerification:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MessageSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 180),
            SizedBox(height: 12),
            _PaymentSummarySkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 160),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 6),
          ],
        );
      case ContractStatus.paymentRejected:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MessageSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 150),
            SizedBox(height: 12),
            _ReasonCardSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 180),
            SizedBox(height: 12),
            _PaymentSummarySkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 160),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 6),
            SizedBox(height: 32),
            _ButtonSkeleton(),
          ],
        );
      case ContractStatus.rejected:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MessageSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 150),
            SizedBox(height: 12),
            _ReasonCardSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 160),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 6),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 90),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 4),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 82),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 3),
            SizedBox(height: 32),
            _ButtonSkeleton(),
          ],
        );
      case ContractStatus.cancelled:
        return const _CenteredStateSkeleton();
      case ContractStatus.waitingVerification:
      case ContractStatus.draft:
      case null:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MessageSkeleton(),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 82),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 2),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 92),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 3),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 150),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 3),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 82),
            SizedBox(height: 12),
            _DetailCardSkeleton(rowCount: 3),
            SizedBox(height: 24),
            _SectionTitleSkeleton(width: 190),
            SizedBox(height: 12),
            _PaymentSummarySkeleton(),
          ],
        );
    }
  }
}

class _MessageSkeleton extends StatelessWidget {
  const _MessageSkeleton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(width: 44, height: 44, borderRadius: 14),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(width: 150, height: 16, borderRadius: 6),
                  SizedBox(height: 10),
                  Skeleton(height: 12, borderRadius: 6),
                  SizedBox(height: 7),
                  Skeleton(width: 210, height: 12, borderRadius: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitleSkeleton extends StatelessWidget {
  final double width;

  const _SectionTitleSkeleton({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Skeleton(width: width, height: 18, borderRadius: 6),
    );
  }
}

class _DetailCardSkeleton extends StatelessWidget {
  final int rowCount;

  const _DetailCardSkeleton({
    required this.rowCount,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Column(
          children: List.generate(
            rowCount,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: index == rowCount - 1 ? 0 : 12),
              child: const _SummaryRowSkeleton(),
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentSummarySkeleton extends StatelessWidget {
  const _PaymentSummarySkeleton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Column(
          children: [
            const _SummaryRowSkeleton(),
            const SizedBox(height: 12),
            const _SummaryRowSkeleton(),
            const SizedBox(height: 18),
            Container(height: 1, color: Colors.white),
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(width: 130, height: 16, borderRadius: 6),
                Skeleton(width: 120, height: 22, borderRadius: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRowSkeleton extends StatelessWidget {
  const _SummaryRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Skeleton(width: 110, height: 13, borderRadius: 6),
        SizedBox(width: 16),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Skeleton(width: 140, height: 14, borderRadius: 6),
          ),
        ),
      ],
    );
  }
}

class _ReasonCardSkeleton extends StatelessWidget {
  const _ReasonCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colorScheme.outline),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(height: 14, borderRadius: 6),
            SizedBox(height: 9),
            Skeleton(height: 14, borderRadius: 6),
            SizedBox(height: 9),
            Skeleton(width: 180, height: 14, borderRadius: 6),
            SizedBox(height: 14),
            Skeleton(width: 120, height: 12, borderRadius: 6),
          ],
        ),
      ),
    );
  }
}

class _ButtonSkeleton extends StatelessWidget {
  const _ButtonSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(height: 52, borderRadius: 12),
    );
  }
}

class _ActiveHeroSkeleton extends StatelessWidget {
  const _ActiveHeroSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(width: 54, height: 54, borderRadius: 14),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 120, height: 20, borderRadius: 6),
                      SizedBox(height: 8),
                      Skeleton(width: 160, height: 12, borderRadius: 6),
                    ],
                  ),
                ),
                Skeleton(width: 72, height: 28, borderRadius: 14),
              ],
            ),
            SizedBox(height: 26),
            Skeleton(width: 86, height: 13, borderRadius: 6),
            SizedBox(height: 8),
            Skeleton(width: 210, height: 36, borderRadius: 8),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Skeleton(height: 68, borderRadius: 14)),
                SizedBox(width: 12),
                Expanded(child: Skeleton(height: 68, borderRadius: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCardSkeleton extends StatelessWidget {
  final int rowCount;

  const _SectionCardSkeleton({
    required this.rowCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Skeleton(width: 7, height: 7, borderRadius: 4),
                SizedBox(width: 8),
                Skeleton(width: 140, height: 12, borderRadius: 6),
              ],
            ),
            const SizedBox(height: 12),
            Container(height: 1, color: Colors.white),
            const SizedBox(height: 10),
            ...List.generate(
              rowCount,
              (index) => Padding(
                padding:
                    EdgeInsets.only(bottom: index == rowCount - 1 ? 0 : 10),
                child: const _SummaryRowSkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionRowSkeleton extends StatelessWidget {
  const _ActionRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 52, borderRadius: 12),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 52, borderRadius: 12),
          ),
        ),
      ],
    );
  }
}

class _CenteredStateSkeleton extends StatelessWidget {
  const _CenteredStateSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: const Center(
        child: AppShimmer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Skeleton(width: 78, height: 78, borderRadius: 22),
              SizedBox(height: 18),
              Skeleton(width: 210, height: 22, borderRadius: 8),
              SizedBox(height: 10),
              Skeleton(width: 260, height: 14, borderRadius: 6),
            ],
          ),
        ),
      ),
    );
  }
}
