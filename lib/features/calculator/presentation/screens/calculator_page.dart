import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int _cowCount = 1;
  final TextEditingController _controller = TextEditingController(text: '1');

  static const double _pricePerCow = 30750000;
  static const double _monthlyYieldPerCow = 1000000;
  static const int _durationMonths = 12;

  final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateCowCount(int count) {
    if (count < 1) count = 1;
    if (count > 1000) count = 1000;
    setState(() {
      _cowCount = count;
      if (_controller.text != count.toString()) {
        _controller.text = count.toString();
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final totalModal = _cowCount * _pricePerCow;
    final monthlyProfit = _cowCount * _monthlyYieldPerCow;
    final totalProfit = monthlyProfit * _durationMonths;
    final totalFinalReturn = totalModal + totalProfit;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Kalkulator Investasi',
              subtitle: 'Simulasi proyeksi bagi hasil Sapi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputSection(colorScheme),
                    const SizedBox(height: 24),
                    _buildSummaryCard(
                      colorScheme,
                      totalModal: totalModal,
                      monthlyProfit: monthlyProfit,
                      totalFinalReturn: totalFinalReturn,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Rincian Proyeksi Bulanan',
                      style: AppTextStyles.title(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildMonthlyTable(colorScheme,
                        monthlyProfit: monthlyProfit),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jumlah Sapi',
            style: AppTextStyles.label(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAdjustButton(
                  Icons.remove, () => _updateCowCount(_cowCount - 1)),
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: colorScheme.onSurface,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    final count = int.tryParse(value) ?? 1;
                    _updateCowCount(count);
                  },
                ),
              ),
              _buildAdjustButton(
                  Icons.add, () => _updateCowCount(_cowCount + 1)),
            ],
          ),
          const SizedBox(height: 16),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: colorScheme.primary,
              inactiveTrackColor:
                  colorScheme.primaryContainer.withValues(alpha: 0.2),
              thumbColor: colorScheme.primary,
              overlayColor: colorScheme.primary.withValues(alpha: 0.1),
            ),
            child: Slider(
              value: _cowCount.toDouble().clamp(1, 100),
              min: 1,
              max: 100,
              divisions: 99,
              onChanged: (value) => _updateCowCount(value.toInt()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjustButton(IconData icon, VoidCallback onTap) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: colorScheme.primary, size: 20),
      ),
    );
  }

  Widget _buildSummaryCard(
    ColorScheme colorScheme, {
    required double totalModal,
    required double monthlyProfit,
    required double totalFinalReturn,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            'Total Modal',
            _currencyFormat.format(totalModal),
            isTransparent: true,
          ),
          const Divider(height: 24, color: Colors.white24),
          _buildSummaryRow(
            'Laba per Bulan',
            _currencyFormat.format(monthlyProfit),
            isTransparent: true,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Pengembalian',
                  style: AppTextStyles.body(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _currencyFormat.format(totalFinalReturn),
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isTransparent = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.body(
              color: isTransparent
                  ? Colors.white.withValues(alpha: 0.8)
                  : Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: AppTextStyles.title(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isTransparent ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildMonthlyTable(ColorScheme colorScheme,
      {required double monthlyProfit}) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: List.generate(_durationMonths, (index) {
          final month = index + 1;
          final isLast = month == _durationMonths;
          final currentMonthlyPayout = monthlyProfit;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              border: index == _durationMonths - 1
                  ? null
                  : Border(
                      bottom: BorderSide(
                          color: colorScheme.outline.withValues(alpha: 0.05))),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLast
                        ? colorScheme.primary
                        : colorScheme.primaryContainer.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      month.toString(),
                      style: AppTextStyles.body(
                        color: isLast ? Colors.white : colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bulan $month',
                        style: AppTextStyles.body(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (isLast)
                        Text(
                          'Estimasi Selesai (Modal + Hasil)',
                          style: AppTextStyles.body(
                            fontSize: 10,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  isLast
                      ? _currencyFormat.format(
                          (_cowCount * _pricePerCow) + currentMonthlyPayout)
                      : _currencyFormat.format(currentMonthlyPayout),
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                    color: isLast ? colorScheme.primary : colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
