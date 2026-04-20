import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class ContractCreatePage extends StatefulWidget {
  const ContractCreatePage({super.key});

  @override
  State<ContractCreatePage> createState() => _ContractCreatePageState();
}

class _ContractCreatePageState extends State<ContractCreatePage> {
  final String partnerName = 'Mulyo Syahidin';
  final String partnerNIK = '3273112345678901';

  int quantity = 1;
  String selectedCowType = 'Brahman Cross';
  int currentPrice = 18000000;

  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  int get subtotal => quantity * currentPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9F5),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Buat Kontrak Baru',
              subtitle: 'Lengkapi rincian akad kerjasama',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Informasi Mitra'),
                    const SizedBox(height: 12),
                    _buildInfoCard([
                      _buildReadOnlyField('Nama Lengkap', partnerName),
                      const SizedBox(height: 16),
                      _buildReadOnlyField('NIK', partnerNIK),
                    ]),
                    const SizedBox(height: 32),

                    _buildSectionHeader('Rincian Kontrak'),
                    const SizedBox(height: 12),
                    _buildFormCard(),
                    const SizedBox(height: 32),

                    _buildSectionHeader('Ringkasan Pembayaran'),
                    const SizedBox(height: 12),
                    _buildCalculationCard(),
                    const SizedBox(height: 48),

                    PrimaryButton(
                      label: 'Submit Kontrak',
                      onPressed: () {
                        // Submit logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kontrak berhasil diajukan')),
                        );
                      },
                      backgroundColor: const Color(0xFF1E5135),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: const Color(0xFF1A1C19),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE8ECE7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            color: const Color(0xFF747972),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: const Color(0xFF1A1C19),
          ),
        ),
      ],
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE8ECE7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jenis Sapi',
            style: AppTextStyles.body(
              color: const Color(0xFF747972),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final result = await context.push(Routes.cowCatalog);
              if (result != null && result is Map<String, dynamic>) {
                setState(() {
                  selectedCowType = result['name'] as String;
                  currentPrice = result['price'] as int;
                });
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE8ECE7)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedCowType,
                    style: AppTextStyles.body(fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF747972)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Jumlah Sapi',
            style: AppTextStyles.body(
              color: const Color(0xFF747972),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildCounterButton(Icons.remove, () {
                if (quantity > 1) setState(() => quantity--);
              }),
              SizedBox(
                width: 60,
                child: Text(
                  quantity.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title(fontWeight: FontWeight.bold),
                ),
              ),
              _buildCounterButton(Icons.add, () {
                setState(() => quantity++);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE8ECE7)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF1E5135)),
      ),
    );
  }

  Widget _buildCalculationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E5135).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E5135).withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          _buildCalcRow('Harga Satuan', currencyFormat.format(currentPrice)),
          const SizedBox(height: 12),
          _buildCalcRow('Jumlah', '$quantity Ekor'),
          const Divider(height: 24, color: Color(0xFFE8ECE7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xFF1A1C19),
                ),
              ),
              Text(
                currencyFormat.format(subtotal),
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E5135),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalcRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body(
            color: const Color(0xFF747972),
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.body(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: const Color(0xFF1A1C19),
          ),
        ),
      ],
    );
  }
}
