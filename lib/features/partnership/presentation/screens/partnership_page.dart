import 'package:app/core/errors/failure.dart';
import 'package:app/features/partnership/application/partnership_controller.dart';
import 'package:app/features/partnership/presentation/screens/partials/active_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/pending_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/rejected_partnership_partial.dart';
import 'package:app/features/partnership/presentation/screens/partials/unregistered_partnership_partial.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PartnershipPage extends ConsumerWidget {
  const PartnershipPage({super.key});

  static const _pageBackground = Color(0xFFF5F0E6);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(partnerControllerProvider);

    return Scaffold(
      backgroundColor: _pageBackground,
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
    return const Center(child: CircularProgressIndicator());
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
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 80),
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
    );
  }
}
