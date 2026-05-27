import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/contract_detail_status_layout.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RejectedContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const RejectedContractDetailPartial({
    super.key,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return ContractDetailStatusLayout(
      contract: contract,
      subtitle: 'Ditolak',
      title: 'Pengajuan Ditolak',
      message:
          'Silakan periksa catatan admin dan lakukan perbaikan data pengajuan.',
      icon: Icons.block_rounded,
      sections: [
        ContractDetailSection(
          title: 'ALASAN PENOLAKAN',
          children: [_buildReason(context)],
        ),
        ContractDetailSection(
          title: 'RINGKASAN KONTRAK',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'Nama Lengkap',
              contract.userName ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'NIK',
              contract.userIdentityNumber ?? '-',
            ),
            if (contract.address != null && contract.address!.trim().isNotEmpty)
              ContractDetailStatusLayout.row(
                  context, 'Alamat', contract.address!),
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
        ContractDetailSection(
          title: 'DATA SAPI',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'Jenis Sapi',
              contract.cowName ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Berat Sapi',
              '${contract.cowWeightKg ?? 0} Kg',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Total Modal',
              ContractDetailStatusLayout.currencyFormat.format(
                contract.cowTotalPrice ?? 0,
              ),
            ),
          ],
        ),
        ContractDetailSection(
          title: 'REKENING',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'Nama Bank',
              contract.bankName ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Nomor Rekening',
              contract.bankAccountNumber ?? '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Atas Nama',
              contract.bankAccountName ?? '-',
            ),
          ],
        ),
      ],
      action: PrimaryButton(
        label: 'Perbaiki Data',
        onPressed: () => context.push(Routes.contractCreate),
        icon: const Icon(Icons.edit_note_rounded),
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
