import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/account/summary/application/user_summary_controller.dart';
import 'package:app/features/account/summary/domain/entities/user_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AccountStatsRow extends ConsumerWidget {
  const AccountStatsRow({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);
  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryState = ref.watch(userSummaryControllerProvider);

    return summaryState.when(
      data: (summary) => _buildStats(context, summary),
      loading: () => _buildStats(
        context,
        const UserSummary(
          totalContracts: 0,
          totalOwnedCows: 0,
          totalReleasedProfit: 0,
        ),
        isLoading: true,
      ),
      error: (error, stackTrace) => _buildStats(
        context,
        const UserSummary(
          totalContracts: 0,
          totalOwnedCows: 0,
          totalReleasedProfit: 0,
        ),
      ),
    );
  }

  Widget _buildStats(
    BuildContext context,
    UserSummary summary, {
    bool isLoading = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                summary.totalContracts.toString(),
                'Kontrak',
                isLoading: isLoading,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                summary.totalOwnedCows.toString(),
                'Sapi',
                isLoading: isLoading,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // if (partner == true) ...[
            //   Expanded(
            //     child: _buildStatCard(context, '5', 'Mitra'),
            //   ),
            //   const SizedBox(width: 12),
            // ],
            Expanded(
              child: _buildStatCard(
                context,
                _currencyFormat.format(summary.totalReleasedProfit),
                'Profit',
                valueColor: _gold,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label, {
    Color? valueColor,
    bool isLoading = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: _softGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _iconForLabel(label),
              color: _green,
              size: 18,
            ),
          ),
          const SizedBox(height: 10),
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? _green,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.label(
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForLabel(String label) {
    switch (label) {
      case 'Kontrak':
        return Icons.description_outlined;
      case 'Sapi':
        return Icons.pets_outlined;
      case 'Profit':
        return Icons.payments_outlined;
      default:
        return Icons.stacked_bar_chart_outlined;
    }
  }
}
