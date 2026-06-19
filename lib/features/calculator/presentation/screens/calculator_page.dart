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

  static const _green = Color(0xFF1F6E2D);
  static const _darkGreen = Color(0xFF155B24);
  static const _tileGreen = Color(0xFF3E8445);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _gold = Color(0xFFD3AB35);

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
    final totalModal = _cowCount * _pricePerCow;
    final monthlyProfit = _cowCount * _monthlyYieldPerCow;
    final totalProfit = monthlyProfit * _durationMonths;
    final totalFinalReturn = totalModal + totalProfit;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Kalkulator Investasi',
              subtitle: 'Simulasi proyeksi bagi hasil Sapi',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInputSection(context),
                    const SizedBox(height: 18),
                    _buildSummaryCard(
                      totalModal: totalModal,
                      monthlyProfit: monthlyProfit,
                      totalFinalReturn: totalFinalReturn,
                    ),
                    const SizedBox(height: 18),
                    _buildProjectionSection(
                      context,
                      monthlyProfit: monthlyProfit,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _whiteCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, 'JUMLAH SAPI'),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAdjustButton(
                Icons.remove,
                () => _updateCowCount(_cowCount - 1),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: _green,
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
                Icons.add,
                () => _updateCowCount(_cowCount + 1),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: _green,
              inactiveTrackColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? _green.withValues(alpha: 0.15)
                      : _softGreen,
              thumbColor: _green,
              overlayColor: _green.withValues(alpha: 0.1),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? _green.withValues(alpha: 0.15)
              : _softGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: _green, size: 20),
      ),
    );
  }

  Widget _buildSummaryCard({
    required double totalModal,
    required double monthlyProfit,
    required double totalFinalReturn,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            _darkGreen,
            Color(0xFF2C8A3C),
            _green,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: _green.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -42,
            top: -50,
            child: _buildSoftCircle(128),
          ),
          Positioned(
            left: -46,
            bottom: -60,
            child: _buildSoftCircle(116),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Total pengembalian',
                style: AppTextStyles.body(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _currencyFormat.format(totalFinalReturn),
                style: AppTextStyles.title(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryMetric(
                      label: 'Total Modal',
                      value: _currencyFormat.format(totalModal),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryMetric(
                      label: 'Profit/bln',
                      value: _currencyFormat.format(monthlyProfit),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSoftCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSummaryMetric({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _tileGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body(
              color: Colors.white.withValues(alpha: 0.72),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: AppTextStyles.title(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectionSection(
    BuildContext context, {
    required double monthlyProfit,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _whiteCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(context, 'RINCIAN PROYEKSI BULANAN'),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          _buildMonthlyTable(context, monthlyProfit: monthlyProfit),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: _gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.body(
            color: _green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMonthlyTable(
    BuildContext context, {
    required double monthlyProfit,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: List.generate(_durationMonths, (index) {
        final month = index + 1;
        final isLast = month == _durationMonths;
        final currentMonthlyPayout = monthlyProfit;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: index == _durationMonths - 1
                ? null
                : Border(
                    bottom: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.16),
                    ),
                  ),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: isLast
                      ? _green
                      : (colorScheme.brightness == Brightness.dark
                          ? _green.withValues(alpha: 0.15)
                          : _softGreen),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    month.toString(),
                    style: AppTextStyles.body(
                      color: isLast ? Colors.white : _green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bulan $month',
                      style: AppTextStyles.body(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    if (isLast)
                      Text(
                        'Estimasi selesai (modal + hasil)',
                        style: AppTextStyles.body(
                          fontSize: 10,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    isLast
                        ? _currencyFormat.format(
                            (_cowCount * _pricePerCow) + currentMonthlyPayout)
                        : _currencyFormat.format(currentMonthlyPayout),
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isLast ? _gold : colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  BoxDecoration _whiteCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
        width: 0.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor.withValues(alpha: 0.06),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
