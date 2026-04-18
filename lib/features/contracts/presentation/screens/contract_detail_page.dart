import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class ContractDetailPage extends StatelessWidget {
  final String contractId;

  const ContractDetailPage({
    super.key,
    required this.contractId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Dummy data for the specific contract
    const mitraName = "Budi Santoso";
    const cattleType = "Sapi Limousin";
    const cattleCount = 5;
    const startDate = "12 April 2026";
    const endDate = "12 April 2027";
    const monthlyProfitSharing = 750000;
    const dueDate = "Setiap tanggal 15";
    const status = "Aktif"; // Draft, Aktif, Wanprestasi, Selesai, Penalty

    final profitSchedule = List.generate(12, (index) {
      return {
        'month': 'Bulan ${index + 1}',
        'date': '15 ${index + 5 > 12 ? index - 7 : index + 5} 2026/2027', // Simplified dummy dating
        'amount': 'Rp ${monthlyProfitSharing.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
        'status': index < 1 ? 'Sudah Dibayar' : 'Mendatang',
      };
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            // Header Gradient
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryLight,
                      theme.scaffoldBackgroundColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    title: Text(
                      'Detail Kontrak',
                      style: AppTextStyles.title(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStatusCard(context, contractId, status),
                          const SizedBox(height: 24),
                          _buildSectionTitle(context, 'Informasi Mitra & Ternak'),
                          const SizedBox(height: 12),
                          _buildInfoCard(context, [
                            {'label': 'Mitra', 'value': mitraName},
                            {'label': 'Sapi', 'value': cattleType},
                            {'label': 'Jumlah Sapi', 'value': '$cattleCount Ekor'},
                          ]),
                          const SizedBox(height: 24),
                          _buildSectionTitle(context, 'Detail Keuangan'),
                          const SizedBox(height: 12),
                          _buildInfoCard(context, [
                            {'label': 'Harga Beli Satuan', 'value': 'Rp 15.000.000'},
                            {'label': 'Total Modal', 'value': 'Rp 75.000.000', 'isBold': true},
                            {'label': 'Bagi Hasil Bulanan', 'value': 'Rp 750.000'},
                            {'label': 'Jatuh Tempo', 'value': dueDate},
                          ]),
                          const SizedBox(height: 24),
                          _buildSectionTitle(context, 'Periode Kontrak'),
                          const SizedBox(height: 12),
                          _buildInfoCard(context, [
                            {'label': 'Tanggal Mulai', 'value': startDate},
                            {'label': 'Tanggal Berakhir', 'value': endDate},
                          ]),
                          const SizedBox(height: 32),
                          _buildSectionTitle(context, 'Jadwal Pembayaran Profit'),
                          const SizedBox(height: 16),
                          _buildProfitSchedule(context, profitSchedule),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, String id, String status) {
    final theme = Theme.of(context);
    final color = status == 'Aktif' ? AppColors.primary : AppColors.warning;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID Kontrak',
                style: AppTextStyles.label(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                id,
                style: AppTextStyles.title(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Text(
              status,
              style: AppTextStyles.label(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, List<Map<String, dynamic>> items) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: items.map((item) {
          final isLast = items.indexOf(item) == items.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['label'],
                  style: AppTextStyles.body(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item['value'],
                  style: AppTextStyles.body(
                    fontWeight: item['isBold'] == true ? FontWeight.w800 : FontWeight.w600,
                    color: item['isBold'] == true ? AppColors.primary : theme.colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProfitSchedule(BuildContext context, List<Map<String, dynamic>> schedule) {
    final theme = Theme.of(context);
    return Column(
      children: schedule.map((item) {
        final isPaid = item['status'] == 'Sudah Dibayar';
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isPaid ? AppColors.primary.withValues(alpha: 0.05) : theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isPaid ? AppColors.primary.withValues(alpha: 0.1) : theme.dividerColor.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isPaid ? AppColors.primary : theme.dividerColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPaid ? Icons.check_rounded : Icons.schedule_rounded,
                  color: isPaid ? Colors.white : theme.colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['month'],
                      style: AppTextStyles.body(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      item['date'],
                      style: AppTextStyles.label(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item['amount'],
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.w700,
                      color: isPaid ? AppColors.primary : theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    item['status'],
                    style: AppTextStyles.label(
                      color: isPaid ? AppColors.primary : AppColors.warning,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
