import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class CancelledContractDetailPartial extends StatelessWidget {
  final Contract contract;

  const CancelledContractDetailPartial({
    super.key,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Dibatalkan',
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Dummy full page untuk status Dibatalkan',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
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
