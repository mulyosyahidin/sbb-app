import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/contract_detail_status_layout.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PaymentRejectedContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const PaymentRejectedContractDetailPartial({
    super.key,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return ContractDetailStatusLayout(
      contract: contract,
      subtitle: 'Pembayaran Ditolak',
      title: 'Pembayaran Ditolak',
      message:
          'Silakan periksa catatan admin dan upload ulang bukti pembayaran yang sesuai.',
      icon: Icons.receipt_long_outlined,
      accentColor: const Color(0xFFD32F2F),
      darkAccentColor: const Color(0xFF8E1B1B),
      middleAccentColor: const Color(0xFFB3261E),
      tileAccentColor: const Color(0xFFE04A3F),
      sections: [
        ContractDetailSection(
          title: 'ALASAN PENOLAKAN',
          children: [_buildReason(context)],
        ),
        ContractDetailSection(
          title: 'RINGKASAN PEMBAYARAN',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'Jumlah Sapi',
              '${contract.cowQuantity ?? 0} Ekor',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Harga Per Ekor',
              ContractDetailStatusLayout.currencyFormat.format(
                contract.cowPrice ?? 0,
              ),
            ),
            ContractDetailStatusLayout.row(
              context,
              'Total Pembayaran',
              ContractDetailStatusLayout.currencyFormat.format(
                contract.cowTotalPrice ?? 0,
              ),
            ),
          ],
        ),
        ContractDetailSection(
          title: 'RINGKASAN KONTRAK',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'Nama Lengkap',
              contract.userName ?? '-',
            ),
            if (contract.address != null && contract.address!.trim().isNotEmpty)
              ContractDetailStatusLayout.row(
                  context, 'Alamat', contract.address!),
            ContractDetailStatusLayout.row(
              context,
              'Jenis Sapi',
              contract.cowName ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Program',
              contract.program?.value ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Durasi',
              '${contract.contractMonthDuration ?? 0} Bulan',
            ),
            ContractDetailStatusLayout.row(
                context, 'Status', contract.status.value),
          ],
        ),
      ],
      action: PrimaryButton(
        label: 'Upload Ulang Bukti Pembayaran',
        onPressed: () => context.push(
          Routes.contractPayment.replaceAll(
            ':id',
            contract.id.toString(),
          ),
        ),
        icon: const Icon(Icons.upload_file_rounded),
      ),
    );
  }

  Widget _buildReason(BuildContext context) {
    final reason = contract.latestNote?.note ?? contract.note ?? '-';
    final createdAt = contract.latestNote?.createdAt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          reason,
          style: AppTextStyles.body(
            fontSize: 14,
            height: 1.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        if (createdAt != null) ...[
          const SizedBox(height: 12),
          Text(
            DateFormat('dd MMMM yyyy, HH:mm', 'id_ID').format(createdAt),
            style: AppTextStyles.body(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
