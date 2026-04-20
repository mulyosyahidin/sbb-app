import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/account/summary/presentation/widgets/account_header.dart';
import 'package:app/features/account/summary/presentation/widgets/account_menu_list.dart';
import 'package:app/features/account/summary/presentation/widgets/account_stats_row.dart';
import 'package:app/features/account/summary/presentation/widgets/consultant_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go(Routes.home);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AccountHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const AccountStatsRow(),
                    const SizedBox(height: 24),
                    _buildSectionTitle(context, 'Panel Konsultan'),
                    const SizedBox(height: 12),
                    const ConsultantPanel(),
                    const SizedBox(height: 24),
                    _buildSectionTitle(context, 'Pengaturan Akun'),
                    const SizedBox(height: 12),
                    const AccountMenuList(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
