import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeGuestCTA extends StatelessWidget {
  const HomeGuestCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.auto_awesome, color: colorScheme.primary, size: 48),
          const SizedBox(height: 16),
          Text(
            'Mulai Investasi Ternak',
            style: AppTextStyles.heading(
                fontWeight: FontWeight.bold, color: colorScheme.onSurface),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Dapatkan hasil maksimal dengan menjadi mitra kami dalam penggemukan sapi berbasis teknologi.',
            style: AppTextStyles.body(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Daftar Sekarang',
            onPressed: () => context.push(Routes.register),
          ),
        ],
      ),
    );
  }
}
