import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class ContractCreateSkeleton extends StatelessWidget {
  const ContractCreateSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        _buildSectionTitleSkeleton(),
        const SizedBox(height: 12),
        _buildCardSkeleton(
          context,
          [
            const InputSkeleton(label: 'Nama Lengkap'),
            const SizedBox(height: 16),
            const InputSkeleton(label: 'NIK'),
            const SizedBox(height: 16),
            const InputSkeleton(label: 'KTP'),
          ],
        ),
        const SizedBox(height: 32),
        _buildSectionTitleSkeleton(),
        const SizedBox(height: 12),
        _buildCardSkeleton(
          context,
          [
            const InputSkeleton(label: 'Jenis Sapi'),
            const SizedBox(height: 24),
            const InputSkeleton(label: 'Jumlah Sapi'),
            const SizedBox(height: 24),
            const InputSkeleton(label: 'Rekening Pembayaran'),
          ],
        ),
        const SizedBox(height: 32),
        _buildSectionTitleSkeleton(),
        const SizedBox(height: 12),
        _buildCardSkeleton(
          context,
          [
            const InputSkeleton(label: 'Pilih Program'),
            const SizedBox(height: 24),
            const InputSkeleton(label: 'Durasi Kontrak'),
          ],
        ),
        const SizedBox(height: 32),
        _buildSectionTitleSkeleton(),
        const SizedBox(height: 12),
        AppShimmer(
          child: Skeleton(
            height: 160,
            borderRadius: 24,
          ),
        ),
        const SizedBox(height: 48),
      ],
    ));
  }

  Widget _buildSectionTitleSkeleton() {
    return const AppShimmer(
      child: Skeleton(width: 120, height: 16),
    );
  }

  Widget _buildCardSkeleton(BuildContext context, List<Widget> children) {
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
        children: children,
      ),
    );
  }
}
