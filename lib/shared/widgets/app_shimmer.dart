import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: baseColor ?? (isDark ? Colors.grey[800]! : Colors.grey[300]!),
      highlightColor:
          highlightColor ?? (isDark ? Colors.grey[700]! : Colors.grey[100]!),
      child: child,
    );
  }
}

class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class InputSkeleton extends StatelessWidget {
  final String? label;
  final bool showLabel;
  final double height;

  const InputSkeleton({
    super.key,
    this.label,
    this.showLabel = true,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!.toUpperCase(),
            style: TextStyle(
              color: colorScheme.primary.withValues(alpha: 0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
        ] else if (showLabel) ...[
          const AppShimmer(
            child: Skeleton(width: 100, height: 14),
          ),
          const SizedBox(height: 8),
        ],
        AppShimmer(
          child: Skeleton(
            height: height,
            borderRadius: 12,
          ),
        ),
      ],
    );
  }
}
