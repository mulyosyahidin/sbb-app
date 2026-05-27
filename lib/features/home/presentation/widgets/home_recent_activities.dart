import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/home/application/home_controller.dart';
import 'package:app/features/home/domain/entities/user_activity.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:string_to_icon/string_to_icon.dart';

class HomeRecentActivities extends ConsumerWidget {
  const HomeRecentActivities({super.key});

  static final _dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesState = ref.watch(userActivitiesProvider);

    return activitiesState.when(
      data: (activities) {
        if (activities.isEmpty) {
          return _buildEmptyState(context);
        }

        return Column(
          children: List.generate(activities.length, (index) {
            final activity = activities[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == activities.length - 1 ? 0 : 12,
              ),
              child: _buildActivityCard(context, activity),
            );
          }),
        );
      },
      loading: () => const _ActivitiesSkeleton(),
      error: (error, stackTrace) => _buildErrorState(context),
    );
  }

  Widget _buildActivityCard(BuildContext context, UserActivity activity) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = _parseColor(activity.color);
    final highlightedText = activity.highlightedText?.trim();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIconData(activity.iconName),
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  activity.description,
                  style: AppTextStyles.label(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (highlightedText != null && highlightedText.isNotEmpty) ...[
                Text(
                  highlightedText,
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                _dateFormat.format(activity.createdAt),
                style: AppTextStyles.label(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Belum ada aktivitas terbaru.',
        textAlign: TextAlign.center,
        style: AppTextStyles.body(
          color: colorScheme.onSurfaceVariant,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Gagal memuat aktivitas terbaru.',
        textAlign: TextAlign.center,
        style: AppTextStyles.body(
          color: colorScheme.onSurfaceVariant,
          fontSize: 13,
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    return IconMapper.getIconData('done');
  }

  Color _parseColor(String value) {
    final hex = value.replaceFirst('#', '');
    final colorValue =
        int.tryParse(hex.length == 6 ? 'FF$hex' : hex, radix: 16);

    return colorValue != null ? Color(colorValue) : Colors.grey;
  }
}

class _ActivitiesSkeleton extends StatelessWidget {
  const _ActivitiesSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index == 2 ? 0 : 12),
          child: const AppShimmer(
            child: Skeleton(height: 78, borderRadius: 16),
          ),
        ),
      ),
    );
  }
}
