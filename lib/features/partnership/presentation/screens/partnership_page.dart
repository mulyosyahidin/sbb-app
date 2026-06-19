import 'package:app/core/errors/failure.dart';
import 'package:app/features/partnership/application/partnership_controller.dart';
import 'package:app/features/partnership/presentation/screens/partials/active_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/pending_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/rejected_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/unregistered_partnership_partial.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PartnershipPage extends ConsumerWidget {
  const PartnershipPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(partnerControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Kemitraan',
              subtitle: 'Status dan pendaftaran mitra',
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () =>
                    ref.read(partnerControllerProvider.notifier).checkPartner(),
                child: state.when(
                  loading: () => const _PartnershipLoading(),
                  error: (error, _) => _PartnershipError(
                    message: error is Failure
                        ? error.message
                        : 'Gagal memuat data kemitraan',
                    onRetry: () => ref
                        .read(partnerControllerProvider.notifier)
                        .checkPartner(),
                  ),
                  data: (data) {
                    if (!data.hasPartner &&
                        data.pendingApplication?.isPending != true &&
                        data.pendingApplication?.isRejected != true) {
                      return const UnregisteredPartnershipPartial();
                    }

                    return ListView(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                      children: [
                        if (data.pendingApplication?.isPending == true)
                          PendingPartnershipPartial(
                            application: data.pendingApplication!,
                          )
                        else if (data.pendingApplication?.isRejected == true)
                          RejectedPartnershipPartial(
                            application: data.pendingApplication!,
                          )
                        else if (data.hasPartner)
                          ActivePartnershipPartial(
                            partnership: data.partnership,
                            levelLabel: data.levelLabel ??
                                data.level?.toString() ??
                                '-',
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PartnershipLoading extends StatelessWidget {
  const _PartnershipLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
      children: const [
        _TabsSkeleton(),
        SizedBox(height: 16),
        _HeroSkeleton(),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _MetricSkeleton()),
            SizedBox(width: 10),
            Expanded(child: _MetricSkeleton()),
          ],
        ),
        SizedBox(height: 22),
        _SectionTitleSkeleton(),
        SizedBox(height: 12),
        _InfoCardSkeleton(),
        SizedBox(height: 14),
        _ReferralSkeleton(),
      ],
    );
  }
}

class _PartnershipError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _PartnershipError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                Icons.error_outline,
                size: 44,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 18),
              PrimaryButton(label: 'Coba Lagi', onPressed: onRetry),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabsSkeleton extends StatelessWidget {
  const _TabsSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(height: 48, borderRadius: 14),
    );
  }
}

class _HeroSkeleton extends StatelessWidget {
  const _HeroSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Skeleton(width: 54, height: 54, borderRadius: 14),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 118, height: 20, borderRadius: 6),
                      SizedBox(height: 8),
                      Skeleton(width: 170, height: 12, borderRadius: 6),
                    ],
                  ),
                ),
                Skeleton(width: 82, height: 28, borderRadius: 14),
              ],
            ),
            SizedBox(height: 26),
            Skeleton(width: 86, height: 13, borderRadius: 6),
            SizedBox(height: 8),
            Skeleton(width: 220, height: 34, borderRadius: 8),
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

class _MetricSkeleton extends StatelessWidget {
  const _MetricSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(height: 116, borderRadius: 14),
    );
  }
}

class _SectionTitleSkeleton extends StatelessWidget {
  const _SectionTitleSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(width: 150, height: 14, borderRadius: 7),
    );
  }
}

class _InfoCardSkeleton extends StatelessWidget {
  const _InfoCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
        child: const Column(
          children: [
            _InfoRowSkeleton(),
            SizedBox(height: 16),
            _InfoRowSkeleton(),
            SizedBox(height: 16),
            _InfoRowSkeleton(),
            SizedBox(height: 16),
            _InfoRowSkeleton(),
          ],
        ),
      ),
    );
  }
}

class _InfoRowSkeleton extends StatelessWidget {
  const _InfoRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Skeleton(width: 40, height: 40, borderRadius: 10),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 110, height: 10, borderRadius: 5),
              SizedBox(height: 8),
              Skeleton(width: 180, height: 15, borderRadius: 6),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReferralSkeleton extends StatelessWidget {
  const _ReferralSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(height: 78, borderRadius: 14),
    );
  }
}
