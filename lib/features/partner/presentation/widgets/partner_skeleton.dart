import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class PartnerSkeleton extends StatelessWidget {
  const PartnerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInfoCardSkeleton(context),
          const SizedBox(height: 32),
          const AppShimmer(
            child: Skeleton(
              height: 48,
              borderRadius: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCardSkeleton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppShimmer(
            child: Skeleton(width: 140, height: 20),
          ),
          const SizedBox(height: 24),
          _buildDetailItemSkeleton(),
          _buildDetailItemSkeleton(),
          _buildDetailItemSkeleton(),
          _buildDetailItemSkeleton(),
          _buildDetailItemSkeleton(),
          _buildDetailItemSkeleton(isLast: true),
        ],
      ),
    );
  }

  Widget _buildDetailItemSkeleton({bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppShimmer(
            child: Skeleton(width: 80, height: 10),
          ),
          SizedBox(height: 8),
          AppShimmer(
            child: Skeleton(width: 180, height: 14),
          ),
        ],
      ),
    );
  }
}
