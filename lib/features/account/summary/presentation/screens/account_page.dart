import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/account/summary/presentation/widgets/account_header.dart';
import 'package:app/features/account/summary/presentation/widgets/account_menu_list.dart';
import 'package:app/features/account/summary/presentation/widgets/account_stats_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  static const _green = Color(0xFF1F6E2D);
  static const _gold = Color(0xFFD3AB35);

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
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AccountStatsRow(),
                    // if (partner == true) ...[
                    //   const SizedBox(height: 24),
                    //   _buildSectionTitle(context, 'Panel Konsultan'),
                    //   const SizedBox(height: 12),
                    //   const ConsultantPanel(),
                    // ],
                    const SizedBox(height: 18),
                    _buildMenuSection(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
                'PENGATURAN AKUN',
                style: AppTextStyles.body(
                  color: _green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 10),
          const AccountMenuList(),
        ],
      ),
    );
  }
}
