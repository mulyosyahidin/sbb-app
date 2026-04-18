import 'package:flutter/material.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';

class HomeContractList extends StatelessWidget {
  const HomeContractList({super.key});

  @override
  Widget build(BuildContext context) {
    final contracts = [
      {
        'title': 'KTR-202604-001',
        'date': '12 Apr 2026',
        'amount': 'Rp 15.000.000',
        'gradient': const LinearGradient(
          colors: [Color(0xFF6EAD5B), Color(0xFF468432)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      },
      {
        'title': 'KTR-202604-002',
        'date': '10 Apr 2026',
        'amount': 'Rp 50.000.000',
        'gradient': const LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      },
      {
        'title': 'KTR-202604-003',
        'date': '08 Apr 2026',
        'amount': 'Rp 25.000.000',
        'gradient': const LinearGradient(
          colors: [Color(0xFFFF7043), Color(0xFFE64A19)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: contracts.length,
      itemBuilder: (context, index) {
        final contract = contracts[index];
        return HomeContractCard(contract: contract);
      },
    );
  }
}

class HomeContractCard extends StatelessWidget {
  final Map<String, dynamic> contract;
  const HomeContractCard({super.key, required this.contract});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        gradient: contract['gradient'] as Gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circle
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.description_rounded,
                              color: Colors.white, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            'KONTRAK',
                            style: AppTextStyles.label(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      contract['title'] as String,
                      style: AppTextStyles.title(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded,
                            color: Colors.white70, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          contract['date'] as String,
                          style: AppTextStyles.label(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nilai',
                        style: AppTextStyles.label(
                          color: AppColors.textSecondaryLight,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        contract['amount'] as String,
                        style: AppTextStyles.title(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
