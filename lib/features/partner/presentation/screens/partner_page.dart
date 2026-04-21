import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/partner/application/partner_controller.dart';
import 'package:app/features/partner/presentation/widgets/partner_skeleton.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

final partnerTabProvider = StateProvider<int>((ref) => 0);

class PartnerPage extends ConsumerWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partnerAsync = ref.watch(partnerControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, ref),
            Expanded(
              child: partnerAsync.when(
                data: (partner) {
                  if (partner == null) return _buildEmptyState(context);

                  final activeTab = ref.watch(partnerTabProvider);
                  switch (activeTab) {
                    case 1:
                      return _buildActivities(context);
                    case 2:
                      return _buildProfits(context);
                    default:
                      return _buildPartnerDetails(context, ref, partner);
                  }
                },
                loading: () => const PartnerSkeleton(),
                error: (error, stack) => _buildErrorState(context, ref, error),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Header ───────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final activeTab = ref.watch(partnerTabProvider);

    return Container(
      color: colorScheme.surface,
      child: Column(
        children: [
          const AppBarHeader(
            title: 'Program Kemitraan',
            subtitle: 'Kelola data kemitraan Anda di sini',
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildTab(context, 'Profil Mitra',
                  isActive: activeTab == 0,
                  onTap: () => ref.read(partnerTabProvider.notifier).state = 0),
              _buildTab(context, 'Aktivitas',
                  isActive: activeTab == 1,
                  onTap: () => ref.read(partnerTabProvider.notifier).state = 1),
              _buildTab(context, 'Keuntungan',
                  isActive: activeTab == 2,
                  onTap: () => ref.read(partnerTabProvider.notifier).state = 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label,
      {required bool isActive, required VoidCallback onTap}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? colorScheme.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color:
                  isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Partner Details ───────────────────────────────────────────────────────

  Widget _buildPartnerDetails(
      BuildContext context, WidgetRef ref, dynamic partner) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 4),
          _buildHeroCard(context, partner),
          const SizedBox(height: 12),
          _buildStatsRow(context),
          const SizedBox(height: 20),
          _buildSectionLabel(context, 'Informasi Pribadi'),
          const SizedBox(height: 8),
          _buildInfoCard(context, partner),
          const SizedBox(height: 20),
          _buildEditButton(context, partner),
          if (partner.level == 'partner') ...[
            const SizedBox(height: 12),
            _buildUpgradeButton(context),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.partnerUpgrade),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Center(
          child: Text(
            'Upgrade jadi Konsultan',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Hero Card ─────────────────────────────────────────────────────────────

  Widget _buildHeroCard(BuildContext context, dynamic partner) {
    final colorScheme = Theme.of(context).colorScheme;
    final initials = _getInitials(partner.name as String);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -10,
            bottom: -30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Avatar
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
                            partner.name as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Bergabung sejak ${DateFormat('dd MMMM yyyy').format(partner.joinDate as DateTime)}',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Badge level
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.white, size: 14),
                      const SizedBox(width: 6),
                      Text(
                        partner.levelLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Stats Row ─────────────────────────────────────────────────────────────

  Widget _buildStatsRow(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.show_chart_rounded,
            iconBg: colorScheme.primaryContainer,
            iconColor: colorScheme.primary,
            value: '24',
            label: 'Investasi aktif',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.people_outline_rounded,
            iconBg: const Color(0xFFE1F5EE),
            iconColor: const Color(0xFF0F6E56),
            value: '18',
            label: 'Referal berhasil',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style:
                AppTextStyles.title(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.body(
              fontSize: 11,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Info Card ─────────────────────────────────────────────────────────────

  Widget _buildSectionLabel(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.label(
          color: colorScheme.onSurfaceVariant,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, dynamic partner) {
    final colorScheme = Theme.of(context).colorScheme;

    final rows = [
      _InfoRowData(
        icon: Icons.person_outline_rounded,
        iconBg: colorScheme.primaryContainer,
        iconColor: colorScheme.primary,
        label: 'Nama Lengkap',
        value: partner.name as String,
      ),
      _InfoRowData(
        icon: Icons.badge_outlined,
        iconBg: const Color(0xFFFAEEDA),
        iconColor: const Color(0xFFBA7517),
        label: 'NIK',
        value: partner.nik as String,
        mono: true,
      ),
      _InfoRowData(
        icon: Icons.location_on_outlined,
        iconBg: const Color(0xFFE1F5EE),
        iconColor: const Color(0xFF0F6E56),
        label: 'Alamat',
        value: partner.address as String,
      ),
      _InfoRowData(
        icon: Icons.phone_outlined,
        iconBg: const Color(0xFFFAECE7),
        iconColor: const Color(0xFF993C1D),
        label: 'Nomor Telepon',
        value: partner.phoneNumber as String,
      ),
      _InfoRowData(
        icon: Icons.calendar_today_outlined,
        iconBg: colorScheme.primaryContainer,
        iconColor: colorScheme.primary,
        label: 'Tanggal Bergabung',
        value: DateFormat('dd MMMM yyyy').format(partner.joinDate as DateTime),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          final i = entry.key;
          final row = entry.value;
          return Column(
            children: [
              if (i != 0)
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: colorScheme.outlineVariant,
                ),
              _buildInfoRow(context, row),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, _InfoRowData data) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: data.iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(data.icon, size: 16, color: data.iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label.toUpperCase(),
                  style: AppTextStyles.label(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.value,
                  style: data.mono
                      ? TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface,
                          letterSpacing: 0.5,
                        )
                      : AppTextStyles.body(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Edit Button ───────────────────────────────────────────────────────────

  Widget _buildEditButton(BuildContext context, dynamic partner) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.push(Routes.partnerEdit, extra: partner),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Empty State ───────────────────────────────────────────────────────────

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.handshake_outlined,
              size: 36,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Buka Kemitraan',
            style: AppTextStyles.heading(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Anda belum menjadi mitra. Ayo daftar sebagai mitra dan mulai berinvestasi.',
            style: AppTextStyles.body(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            label: 'BUKA KEMITRAAN SEKARANG',
            onPressed: () => context.push(Routes.openPartner),
          ),
        ],
      ),
    );
  }

  // ─── Error State ───────────────────────────────────────────────────────────

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Gagal mengambil data mitra', style: AppTextStyles.title()),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.body(),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Coba Lagi',
              onPressed: () => ref.refresh(partnerControllerProvider),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0].substring(0, parts[0].length.clamp(0, 2)).toUpperCase();
  }

  // ─── Aktivitas Tab ────────────────────────────────────────────────────────

  Widget _buildActivities(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final activities = [
      {
        'title': 'Registrasi Mitra Berhasil',
        'desc': 'Selamat! Anda telah resmi bergabung sebagai mitra SBB.',
        'date': '20 Apr 2026, 12:04',
        'icon': Icons.check_circle_outline,
        'color': const Color(0xFF0F6E56),
      },
      {
        'title': 'Update Profil Mitra',
        'desc': 'Anda melakukan pembaruan pada data alamat dan nomor telepon.',
        'date': '19 Apr 2026, 15:30',
        'icon': Icons.edit_note_rounded,
        'color': colorScheme.primary,
      },
      {
        'title': 'Cek Kontrak Baru',
        'desc':
            'Anda melihat detail katalog sapi untuk persiapan kontrak investasi.',
        'date': '18 Apr 2026, 09:15',
        'icon': Icons.visibility_outlined,
        'color': const Color(0xFFBA7517),
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final item = activities[index];
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (item['color'] as Color).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item['icon'] as IconData,
                        size: 20, color: item['color'] as Color),
                  ),
                  if (index != activities.length - 1)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: colorScheme.outlineVariant,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'] as String,
                          style:
                              AppTextStyles.body(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(item['desc'] as String,
                          style: AppTextStyles.body(
                              fontSize: 12,
                              color: colorScheme.onSurfaceVariant)),
                      const SizedBox(height: 6),
                      Text(item['date'] as String,
                          style: AppTextStyles.label(
                              fontSize: 10,
                              color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ─── Keuntungan Tab ────────────────────────────────────────────────────────

  Widget _buildProfits(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -30,
                  top: -30,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  left: -20,
                  bottom: -40,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Keuntungan Anda',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Rp 12.500.000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          _buildProfitStat('Bonus Referral', 'Rp 1.250.000'),
                          const SizedBox(width: 24),
                          _buildProfitStat('Point Reward', '450 Pts'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionLabel(context, 'Riwayat Keuntungan'),
          const SizedBox(height: 12),
          _buildProfitItem(context, 'Bagi Hasil Investasi - Sapi Limosin',
              '+Rp 2.450.000', '20 Mar 2026'),
          _buildProfitItem(context, 'Bonus Referral - Martin MS', '+Rp 250.000',
              '15 Mar 2026'),
          _buildProfitItem(context, 'Bagi Hasil Investasi - Sapi Brahman',
              '+Rp 1.800.000', '01 Mar 2026'),
          _buildProfitItem(
              context, 'Bonus Loyalty Partner', '+Rp 500.000', '28 Feb 2026'),
        ],
      ),
    );
  }

  Widget _buildProfitStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 11)),
        const SizedBox(height: 2),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildProfitItem(
      BuildContext context, String title, String amount, String date) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5EE),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.account_balance_wallet_outlined,
                size: 20, color: Color(0xFF0F6E56)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.body(
                        fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 2),
                Text(date,
                    style: AppTextStyles.label(
                        fontSize: 11, color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          Text(amount,
              style: const TextStyle(
                  color: Color(0xFF0F6E56),
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ],
      ),
    );
  }
}

// ─── Data class ──────────────────────────────────────────────────────────────

class _InfoRowData {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final String value;
  final bool mono;

  const _InfoRowData({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.value,
    this.mono = false,
  });
}
