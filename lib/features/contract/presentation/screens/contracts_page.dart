import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContractItem {
  final String id;
  final String sapi;
  final String modal;
  final String bagiHasil;
  final String status;
  final double progress;
  final String? profit;

  ContractItem({
    required this.id,
    required this.sapi,
    required this.modal,
    required this.bagiHasil,
    required this.status,
    required this.progress,
    this.profit,
  });
}

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  String selectedFilter = 'Semua';
  final filters = ['Semua', 'Aktif', 'Proses', 'Selesai', 'Qurban'];

  final List<ContractItem> contracts = [
    ContractItem(
      id: 'SBB-K-2026-039',
      sapi: '#SBB-014',
      modal: 'Rp 18jt',
      bagiHasil: '60/40',
      status: 'Aktif',
      progress: 0.72,
    ),
    ContractItem(
      id: 'SBB-K-2026-041',
      sapi: '#SBB-021',
      modal: 'Rp 20jt',
      bagiHasil: '60/40',
      status: 'Proses',
      progress: 0.15,
    ),
    ContractItem(
      id: 'SBB-K-2025-088',
      sapi: '#SBB-007',
      modal: 'Rp 17jt',
      bagiHasil: '60/40',
      status: 'Selesai',
      progress: 1.0,
      profit: '+Rp 4,2jt',
    ),
    ContractItem(
      id: 'SBB-K-2026-045',
      sapi: '#SBB-032',
      modal: 'Rp 15jt',
      bagiHasil: '60/40',
      status: 'Aktif',
      progress: 0.45,
    ),
    ContractItem(
      id: 'SBB-K-2026-048',
      sapi: '#SBB-019',
      modal: 'Rp 22jt',
      bagiHasil: '60/40',
      status: 'Proses',
      progress: 0.05,
    ),
    ContractItem(
      id: 'SBB-K-2025-092',
      sapi: '#SBB-011',
      modal: 'Rp 19jt',
      bagiHasil: '60/40',
      status: 'Selesai',
      progress: 1.0,
      profit: '+Rp 3,8jt',
    ),
    ContractItem(
      id: 'SBB-Q-2026-001',
      sapi: '#SBB-Q01',
      modal: 'Rp 25jt',
      bagiHasil: '60/40',
      status: 'Qurban',
      progress: 0.85,
    ),
    ContractItem(
      id: 'SBB-Q-2026-002',
      sapi: '#SBB-Q02',
      modal: 'Rp 22jt',
      bagiHasil: '60/40',
      status: 'Qurban',
      progress: 0.60,
    ),
    ContractItem(
      id: 'SBB-Q-2026-003',
      sapi: '#SBB-Q03',
      modal: 'Rp 27jt',
      bagiHasil: '60/40',
      status: 'Qurban',
      progress: 0.40,
    ),
    ContractItem(
      id: 'SBB-Q-2026-004',
      sapi: '#SBB-Q04',
      modal: 'Rp 24jt',
      bagiHasil: '60/40',
      status: 'Qurban',
      progress: 0.20,
    ),
    ContractItem(
      id: 'SBB-Q-2026-005',
      sapi: '#SBB-Q05',
      modal: 'Rp 26jt',
      bagiHasil: '60/40',
      status: 'Qurban',
      progress: 0.10,
    ),
  ];

  List<ContractItem> get filteredContracts {
    if (selectedFilter == 'Semua') return contracts;
    return contracts.where((item) => item.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilters(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredContracts.length,
                itemBuilder: (context, index) {
                  return _buildContractCard(filteredContracts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return AppBarHeader(
      title: 'Daftar Kontrak',
      subtitle: selectedFilter == 'Semua'
          ? '${contracts.length} kontrak terdaftar'
          : '${filteredContracts.length} kontrak $selectedFilter',
      trailing: InkWell(
        onTap: () => context.push(Routes.contractCreate),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, // Primary green from theme
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => setState(() => selectedFilter = filter),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Center(
                  child: Text(
                    filter,
                    style: AppTextStyles.body(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContractCard(ContractItem item) {
    return InkWell(
      onTap: () => context.push(
        Routes.contractDetail.replaceAll(':id', item.id),
      ),
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
                item.id,
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
              _buildDetailItem('Sapi', item.sapi, isBold: true),
              _buildDetailItem('Modal', item.modal, isBold: true),
              if (item.profit != null)
                _buildDetailItem('Profit', item.profit!,
                    isBold: true, valueColor: Theme.of(context).colorScheme.primary)
              else
                _buildDetailItem('Bagi Hasil', item.bagiHasil, isBold: true),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progres penggemukan',
                style: AppTextStyles.body(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '${(item.progress * 100).toInt()}%',
                style: AppTextStyles.body(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: item.progress,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
              color: Theme.of(context).colorScheme.primary,
              minHeight: 8,
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color color;

    switch (status) {
      case 'Aktif':
        color = const Color(0xFF4CAF50);
        break;
      case 'Proses':
        color = const Color(0xFFFF9800);
        break;
      case 'Selesai':
        color = const Color(0xFF2196F3);
        break;
      case 'Qurban':
        color = const Color(0xFF9C27B0);
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: AppTextStyles.body(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isDark ? color.withValues(alpha: 0.9) : color,
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value,
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
