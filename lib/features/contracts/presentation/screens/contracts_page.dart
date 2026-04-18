import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class ContractsPage extends StatelessWidget {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final dummyContracts = [
      {
        'id': 'KTR-202604-001',
        'cows': 5,
        'amount': 'Rp 75.000.000',
        'expiryDate': '12 Apr 2027',
        'status': 'Aktif',
        'color': const Color(0xFF468432),
      },
      {
        'id': 'KTR-202604-002',
        'cows': 12,
        'amount': 'Rp 180.000.000',
        'expiryDate': '10 Apr 2027',
        'status': 'Aktif',
        'color': const Color(0xFF1976D2),
      },
      {
        'id': 'KTR-202603-045',
        'cows': 2,
        'amount': 'Rp 30.000.000',
        'expiryDate': '25 Mar 2027',
        'status': 'Aktif',
        'color': const Color(0xFFE64A19),
      },
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            // Background Header (Matching Home/Open Mitra Style)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
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
            // Decorative circles
            Positioned(
              top: -30,
              right: -20,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
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
                      'Daftar Kontrak',
                      style: AppTextStyles.title(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final contract = dummyContracts[index];
                          return _ContractListItem(contract: contract);
                        },
                        childCount: dummyContracts.length,
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContractListItem extends StatelessWidget {
  final Map<String, dynamic> contract;

  const _ContractListItem({required this.contract});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: () => context.push('${Routes.contracts}/${contract['id']}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: IntrinsicHeight(
            child: Row(
              children: [
                // Color indicator
                Container(
                  width: 6,
                  color: contract['color'] as Color,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              contract['id'] as String,
                              style: AppTextStyles.body(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: (contract['color'] as Color).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                contract['status'] as String,
                                style: AppTextStyles.label(
                                  color: contract['color'] as Color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildDetailItem(
                              context,
                              icon: Icons.pets_rounded,
                              label: 'Jumlah Sapi',
                              value: '${contract['cows']} Ekor',
                            ),
                            const Spacer(),
                            _buildDetailItem(
                              context,
                              icon: Icons.calendar_today_rounded,
                              label: 'Berlaku Sampai',
                              value: contract['expiryDate'] as String,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(height: 1),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Kontrak',
                              style: AppTextStyles.body(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              contract['amount'] as String,
                              style: AppTextStyles.title(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTextStyles.label(
                color: colorScheme.onSurfaceVariant,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
