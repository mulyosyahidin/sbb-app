import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/account/presentation/widgets/account_header.dart';
import 'package:app/features/account/presentation/widgets/account_menu_list.dart';
import 'package:app/features/account/presentation/widgets/account_stats_row.dart';
import 'package:app/features/account/presentation/widgets/consultant_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
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
                  _buildSectionTitle('Panel Konsultan'),
                  const SizedBox(height: 12),
                  const ConsultantPanel(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Pengaturan Akun'),
                  const SizedBox(height: 12),
                  const AccountMenuList(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.title(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
