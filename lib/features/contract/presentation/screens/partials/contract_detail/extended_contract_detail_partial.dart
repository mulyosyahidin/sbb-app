import 'package:app/app/app_router.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/contract_detail_status_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExtendedContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const ExtendedContractDetailPartial({
    super.key,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return ContractDetailStatusLayout(
      contract: contract,
      subtitle: 'Diperpanjang',
      title: 'Kontrak Diperpanjang',
      message: 'Kontrak kemitraan masih berjalan dalam masa perpanjangan.',
      icon: Icons.update_rounded,
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
              context,
              'Tanggal Mulai',
              contract.startDate != null
                  ? ContractDetailStatusLayout.dateFormat
                      .format(contract.startDate!)
                  : '-',
            ),
            ContractDetailStatusLayout.row(
              context,
              'Tanggal Selesai',
              contract.endDate != null
                  ? ContractDetailStatusLayout.dateFormat
                      .format(contract.endDate!)
                  : '-',
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
      action: ElevatedButton.icon(
        onPressed: () => context.push(
          Routes.contractPaymentSchedules.replaceAll(
            ':id',
            contract.id.toString(),
          ),
          extra: contract,
        ),
        icon: const Icon(Icons.event_note_rounded),
        label: const Text('Jadwal Pembayaran'),
        style: ElevatedButton.styleFrom(
          backgroundColor: ContractDetailStatusLayout.green,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
