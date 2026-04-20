import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class CowCatalogPage extends StatelessWidget {
  const CowCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cows = [
      {
        'name': 'Brahman Cross',
        'price': 18000000,
        'image': 'assets/images/cows/brahman.png',
        'desc': 'Sapi tahan panas dengan pertumbuhan stabil.',
      },
      {
        'name': 'Limousin',
        'price': 22000000,
        'image': 'assets/images/cows/limousin.png',
        'desc': 'Kualitas karkas tinggi dan pertumbuhan cepat.',
      },
    ];

    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9F5),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Pilih Jenis Sapi',
              subtitle: 'Klik pada kartu untuk memilih',
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: cows.length,
                itemBuilder: (context, index) {
                  final cow = cows[index];
                  return InkWell(
                    onTap: () => context.pop(cow),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE8ECE7)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              child: Image.asset(
                                cow['image'] as String,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cow['name'] as String,
                                  style: AppTextStyles.body(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  currencyFormat.format(cow['price']),
                                  style: AppTextStyles.body(
                                    color: const Color(0xFF1E5135),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
