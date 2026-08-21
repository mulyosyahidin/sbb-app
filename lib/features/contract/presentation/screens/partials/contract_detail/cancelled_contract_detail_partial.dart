import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/contract_detail_status_layout.dart';
import 'package:flutter/material.dart';

class CancelledContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const CancelledContractDetailPartial({
    super.key,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return ContractDetailStatusLayout(
      contract: contract,
      subtitle: 'Dibatalkan',
      title: 'Kontrak Dibatalkan',
      message:
          'Kontrak ini sudah dibatalkan. Detail kontrak tetap dapat dilihat sebagai catatan.',
      icon: Icons.cancel_outlined,
      sections: [
        ContractDetailSection(
          title: 'RINGKASAN KONTRAK',
          children: [
            ContractDetailStatusLayout.row(
              context,
              'No. Kontrak',
              contract.contractNumber ?? '-',
            ),
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
                context, 'Jenis Sapi', contract.cowName ?? '-'),
            ContractDetailStatusLayout.row(
              context,
              'Harga Per Ekor',
              ContractDetailStatusLayout.currencyFormat
                  .format(contract.cowPrice ?? 0),
            ),
          ],
        ),
      ],
    );
  }
}
