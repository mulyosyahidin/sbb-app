import 'package:app/features/home/presentation/widgets/home_header_widget.dart';
import 'package:app/features/home/presentation/widgets/primary_balance_card.dart';
import 'package:app/features/home/presentation/widgets/secondary_balance_card.dart';
import 'package:flutter/material.dart';

class SummaryPartial extends StatelessWidget {
  const SummaryPartial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeaderWidget(),
        const SizedBox(height: 32),
        Row(
          children: const [
            Expanded(child: PrimaryBalanceCard()),
            SizedBox(width: 16),
            Expanded(child: SecondaryBalanceCard()),
          ],
        ),
      ],
    );
  }
}
