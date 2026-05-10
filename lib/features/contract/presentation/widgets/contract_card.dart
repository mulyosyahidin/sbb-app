import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ContractCard extends StatelessWidget {
  final Contract item;

  const ContractCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final isDraft = item.status == ContractStatus.draft;

    return InkWell(
      onTap: () {
        if (isDraft) {
          context.push(Routes.contractCreate);
        } else {
          context.push(
            Routes.contractDetail.replaceAll(':id', item.id.toString()),
          );
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isDraft
                      ? 'Draft Kontrak'
                      : (item.contractNumber ?? 'No. Kontrak -'),
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                _buildStatusBadge(context, item.status),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildDetailItem(context, 'Sapi', item.cowName ?? '-',
                      isBold: true),
                ),
                Expanded(
                  flex: isDraft ? 1 : 3,
                  child: _buildDetailItem(
                    context,
                    'Modal',
                    currencyFormat.format(item.cowTotalPrice ?? 0),
                    isBold: true,
                  ),
                ),
                if (!isDraft)
                  Expanded(
                    flex: 2,
                    child: _buildDetailItem(
                      context,
                      'Bagi Hasil',
                      item.profitSharingPercentage != null
                          ? '${item.profitSharingPercentage!.toInt()}%'
                          : '-',
                      isBold: true,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Masa Kontrak',
                  style: AppTextStyles.body(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  item.startDate != null && item.endDate != null
                      ? '${DateFormat('dd MMM yyyy').format(item.startDate!)} - ${DateFormat('dd MMM yyyy').format(item.endDate!)}'
                      : '${item.contractMonthDuration ?? 0} Bulan',
                  style: AppTextStyles.body(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, ContractStatus status) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color color;

    switch (status) {
      case ContractStatus.active:
      case ContractStatus.extended:
        color = const Color(0xFF4CAF50);
        break;
      case ContractStatus.waitingVerification:
      case ContractStatus.waitingPayment:
        color = const Color(0xFFFF9800);
        break;
      case ContractStatus.draft:
        color = Colors.grey;
        break;
      case ContractStatus.completed:
        color = const Color(0xFF2196F3);
        break;
      case ContractStatus.rejected:
      case ContractStatus.cancelled:
        color = const Color(0xFFF44336);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.value,
        style: AppTextStyles.body(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isDark ? color.withValues(alpha: 0.9) : color,
        ),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            fontSize: 11,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
