import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/application/contract_detail_controller.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/payment_schedule.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ContractPaymentSchedulesPage extends ConsumerWidget {
  final String contractId;
  final Contract? initialContract;

  const ContractPaymentSchedulesPage({
    super.key,
    required this.contractId,
    this.initialContract,
  });

  static final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final _dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialContract != null) {
      return _PaymentSchedulesContent(contract: initialContract!);
    }

    final contractState =
        ref.watch(contractDetailControllerProvider(contractId));

    return contractState.when(
      data: (contract) => _PaymentSchedulesContent(contract: contract),
      loading: () => const _PaymentSchedulesLoadingPage(),
      error: (error, stackTrace) => _PaymentSchedulesErrorPage(error: error),
    );
  }
}

class _PaymentSchedulesContent extends StatelessWidget {
  final Contract contract;

  const _PaymentSchedulesContent({
    required this.contract,
  });

  static const _summaryGreen = Color(0xFF226B2F);
  static const _summaryTileGreen = Color(0xFF3E8445);
  static const _dummyProfitSharing = 12000000.0;
  static const _dummyDistributed = 2000000.0;
  static const _dummyRunningMonth = 2;
  static const _dummyTotalMonth = 12;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final schedules = [...?contract.paymentSchedules]
      ..sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Jadwal Pembayaran',
              subtitle: 'Kontrak Aktif',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildProfitSummaryCard(context),
                    const SizedBox(height: 20),
                    if (schedules.isEmpty)
                      _buildEmptyCard(context)
                    else
                      _buildScheduleTable(context, schedules),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitSummaryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _summaryGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pembagian profit',
            style: AppTextStyles.body(
              color: Colors.white.withValues(alpha: 0.72),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            ContractPaymentSchedulesPage._currencyFormat
                .format(_dummyProfitSharing),
            style: AppTextStyles.title(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          const SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: _buildSummaryMetric(
                  label: 'Tersalurkan',
                  value: ContractPaymentSchedulesPage._currencyFormat
                      .format(_dummyDistributed),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _buildSummaryMetric(
                  label: 'Berjalan',
                  value: '$_dummyRunningMonth/$_dummyTotalMonth bln',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryMetric({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: _summaryTileGreen,
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
              fontSize: 13,
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
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleTable(
    BuildContext context,
    List<PaymentSchedule> schedules,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            _buildTableHeader(context),
            ...schedules.asMap().entries.map(
                  (entry) => _buildTableRow(
                    context,
                    month: entry.key + 1,
                    schedule: entry.value,
                    showDivider: entry.key != schedules.length - 1,
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      color: colorScheme.surface,
      child: Row(
        children: [
          _buildHeaderCell(context, 'Bln', flex: 1, textAlign: TextAlign.left),
          _buildHeaderCell(context, 'Tanggal salur', flex: 3),
          _buildHeaderCell(context, 'Profit',
              flex: 3, textAlign: TextAlign.end),
          _buildHeaderCell(context, 'Status',
              flex: 3, textAlign: TextAlign.end),
        ],
      ),
    );
  }

  Widget _buildTableRow(
    BuildContext context, {
    required int month,
    required PaymentSchedule schedule,
    required bool showDivider,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusStyle = _statusStyle(schedule);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: showDivider
            ? Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.18),
                ),
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                month.toString(),
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: _summaryGreen,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                ContractPaymentSchedulesPage._dateFormat.format(schedule.date),
                style: AppTextStyles.body(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  '+${ContractPaymentSchedulesPage._currencyFormat.format(schedule.nominal)}',
                  style: AppTextStyles.title(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: statusStyle.textColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: _buildStatusChip(context, statusStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(
    BuildContext context,
    String label, {
    required int flex,
    TextAlign textAlign = TextAlign.left,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: textAlign,
        style: AppTextStyles.body(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, _ScheduleStatusStyle style) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: style.borderColor),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          style.label,
          style: AppTextStyles.body(
            fontWeight: FontWeight.bold,
            fontSize: 11,
            color: style.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_busy_outlined,
            color: colorScheme.onSurfaceVariant,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            'Jadwal pembayaran belum tersedia.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  _ScheduleStatusStyle _statusStyle(PaymentSchedule schedule) {
    if (schedule.status == PaymentScheduleStatus.success) {
      return const _ScheduleStatusStyle(
        label: 'Tersalurkan',
        textColor: Color(0xFF226B2F),
        backgroundColor: Color(0xFFEFF8EA),
        borderColor: Color(0xFFE1EFD9),
      );
    }

    return const _ScheduleStatusStyle(
      label: 'Terjadwal',
      textColor: Color(0xFF6F7480),
      backgroundColor: Color(0xFFF5F5F4),
      borderColor: Color(0xFFE1E1DF),
    );
  }
}

class _ScheduleStatusStyle {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const _ScheduleStatusStyle({
    required this.label,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
  });
}

class _PaymentSchedulesLoadingPage extends StatelessWidget {
  const _PaymentSchedulesLoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: Column(
          children: [
            AppBarHeader(
              title: 'Jadwal Pembayaran',
              subtitle: 'Memuat data',
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentSchedulesErrorPage extends StatelessWidget {
  final Object error;

  const _PaymentSchedulesErrorPage({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final message = error is Failure
        ? (error as Failure).message
        : 'Gagal mendapatkan jadwal pembayaran';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Jadwal Pembayaran',
              subtitle: 'Terjadi kesalahan',
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
