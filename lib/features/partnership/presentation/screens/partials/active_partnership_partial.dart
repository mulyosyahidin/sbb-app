import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/partnership/domain/entities/partnership.dart';
import 'package:flutter/material.dart';

class ActivePartnershipPartial extends StatefulWidget {
  final Partner? partnership;
  final String levelLabel;

  const ActivePartnershipPartial({
    super.key,
    this.partnership,
    required this.levelLabel,
  });

  @override
  State<ActivePartnershipPartial> createState() =>
      _ActivePartnershipPartialState();
}

class _ActivePartnershipPartialState extends State<ActivePartnershipPartial> {
  int _selectedTab = 0;

  static const _green = Color(0xFF3F8A32);
  static const _darkGreen = Color(0xFF1F6E2D);
  static const _tileGreen = Color(0xFF3E8445);
  static const _mint = Color(0xFFE0F6EF);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _softGold = Color(0xFFF8EEDC);
  static const _gold = Color(0xFFD3AB35);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PartnershipTabs(
          selectedIndex: _selectedTab,
          onChanged: (index) => setState(() => _selectedTab = index),
        ),
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          child: _selectedTab == 0
              ? _ProfileTab(
                  partnership: widget.partnership,
                  levelLabel:
                      widget.partnership?.levelLabel ?? widget.levelLabel,
                )
              : const _ActivityTab(),
        ),
      ],
    );
  }
}

class _PartnershipTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _PartnershipTabs({
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const tabs = ['Profil', 'Aktivitas'];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          for (var index = 0; index < tabs.length; index++)
            Expanded(
              child: InkWell(
                onTap: () => onChanged(index),
                borderRadius: BorderRadius.circular(11),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? _ActivePartnershipPartialState._darkGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: AppTextStyles.body(
                        color: selectedIndex == index
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final Partner? partnership;
  final String levelLabel;

  const _ProfileTab({
    required this.partnership,
    required this.levelLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('profile'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PartnerHeroCard(levelLabel: levelLabel),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: _MetricCard(
                icon: Icons.trending_up_rounded,
                iconBackground: _ActivePartnershipPartialState._softGreen,
                iconColor: _ActivePartnershipPartialState._darkGreen,
                value: '24',
                label: 'Investasi aktif',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _MetricCard(
                icon: Icons.groups_2_outlined,
                iconBackground: _ActivePartnershipPartialState._mint,
                iconColor: Color(0xFF187B68),
                value: '18',
                label: 'Referral berhasil',
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const _SectionTitle('INFORMASI PRIBADI'),
        const SizedBox(height: 12),
        const _PersonalInfoCard(),
        const SizedBox(height: 14),
        _ReferralCodeCard(code: partnership?.refferalCode),
      ],
    );
  }
}

class _PartnerHeroCard extends StatelessWidget {
  final String levelLabel;

  const _PartnerHeroCard({required this.levelLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            _ActivePartnershipPartialState._darkGreen,
            Color(0xFF2C8A3C),
            _ActivePartnershipPartialState._green,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color:
                _ActivePartnershipPartialState._green.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -52,
            top: -52,
            child: _SoftCircle(size: 128, alpha: 0.08),
          ),
          Positioned(
            left: -44,
            bottom: -58,
            child: _SoftCircle(size: 116, alpha: 0.06),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: const Text(
                        'MM',
                        style: TextStyle(
                          color: _ActivePartnershipPartialState._darkGreen,
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mitra aktif',
                            style: AppTextStyles.title(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Bergabung sejak 28 April 2026',
                            style: AppTextStyles.body(
                              color: Colors.white.withValues(alpha: 0.78),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _ActivePartnershipPartialState._gold,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        levelLabel.toUpperCase(),
                        style: AppTextStyles.body(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Nama mitra',
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
                    'Martin Mulyo Syahidin',
                    style: AppTextStyles.title(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    const Expanded(
                      child: _HeroMetric(
                        label: 'Investasi aktif',
                        value: '24',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _HeroMetric(
                        label: 'Level',
                        value: levelLabel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  final double size;
  final double alpha;

  const _SoftCircle({
    required this.size,
    required this.alpha,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: alpha),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  final String label;
  final String value;

  const _HeroMetric({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _ActivePartnershipPartialState._tileGreen,
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
                letterSpacing: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String value;
  final String label;

  const _MetricCard({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: AppTextStyles.title(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.body(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: _ActivePartnershipPartialState._gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.body(
            color: _ActivePartnershipPartialState._darkGreen,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}

class _PersonalInfoCard extends StatelessWidget {
  const _PersonalInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          _PersonalInfoRow(
            icon: Icons.person_outline_rounded,
            iconBackground: _ActivePartnershipPartialState._softGreen,
            iconColor: _ActivePartnershipPartialState._darkGreen,
            label: 'NAMA LENGKAP',
            value: 'Martin Mulyo Syahidin',
          ),
          _DividerLine(),
          _PersonalInfoRow(
            icon: Icons.badge_outlined,
            iconBackground: _ActivePartnershipPartialState._softGold,
            iconColor: Color(0xFFA56B00),
            label: 'NIK',
            value: '1706132003000003',
          ),
          _DividerLine(),
          _PersonalInfoRow(
            icon: Icons.location_on_outlined,
            iconBackground: _ActivePartnershipPartialState._mint,
            iconColor: Color(0xFF16806D),
            label: 'ALAMAT',
            value: 'Bengkulu, Indonesia',
          ),
          _DividerLine(),
          _PersonalInfoRow(
            icon: Icons.calendar_today_outlined,
            iconBackground: _ActivePartnershipPartialState._softGreen,
            iconColor: _ActivePartnershipPartialState._darkGreen,
            label: 'TANGGAL BERGABUNG',
            value: '28 April 2026',
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String label;
  final String value;

  const _PersonalInfoRow({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.body(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: AppTextStyles.body(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
    );
  }
}

class _ReferralCodeCard extends StatelessWidget {
  final String? code;

  const _ReferralCodeCard({required this.code});

  @override
  Widget build(BuildContext context) {
    final referralCode = code?.trim().isNotEmpty == true ? code!.trim() : '-';

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _ActivePartnershipPartialState._darkGreen,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color:
                _ActivePartnershipPartialState._green.withValues(alpha: 0.14),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.qr_code_2_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kode Referral',
                  style: AppTextStyles.body(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  referralCode,
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.copy_rounded, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}

class _ActivityTab extends StatelessWidget {
  const _ActivityTab();

  @override
  Widget build(BuildContext context) {
    return const Column(
      key: ValueKey('activity'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _CommissionSummaryCard(),
        SizedBox(height: 22),
        _SectionTitle('RIWAYAT KOMISI'),
        SizedBox(height: 12),
        _CommissionHistoryCard(
          title: 'Bagi Hasil Investasi - Sapi Limosin',
          date: '20 Mar 2026',
          amount: '+Rp 2.450.000',
        ),
        SizedBox(height: 12),
        _CommissionHistoryCard(
          title: 'Bonus Referral - Martin MS',
          date: '15 Mar 2026',
          amount: '+Rp 250.000',
        ),
        SizedBox(height: 12),
        _CommissionHistoryCard(
          title: 'Bagi Hasil Investasi - Sapi Brahman',
          date: '01 Mar 2026',
          amount: '+Rp 1.800.000',
        ),
        SizedBox(height: 12),
        _CommissionHistoryCard(
          title: 'Bonus Loyalty Partner',
          date: '28 Feb 2026',
          amount: '+Rp 500.000',
        ),
      ],
    );
  }
}

class _CommissionSummaryCard extends StatelessWidget {
  const _CommissionSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            _ActivePartnershipPartialState._darkGreen,
            Color(0xFF2C8A3C),
            _ActivePartnershipPartialState._green,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color:
                _ActivePartnershipPartialState._green.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -52,
            top: -52,
            child: _SoftCircle(size: 128, alpha: 0.08),
          ),
          const Positioned(
            left: -44,
            bottom: -58,
            child: _SoftCircle(size: 116, alpha: 0.06),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Komisi',
                  style: AppTextStyles.body(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp 12.500.000',
                  style: AppTextStyles.title(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 22),
                const Row(
                  children: [
                    Expanded(
                      child: _HeroMetric(
                        label: 'Bonus Referral',
                        value: 'Rp 1.250.000',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _HeroMetric(
                        label: 'Point Reward',
                        value: '450 Pts',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommissionHistoryCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const _CommissionHistoryCard({
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _ActivePartnershipPartialState._mint,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Color(0xFF16806D),
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppTextStyles.body(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            amount,
            style: AppTextStyles.body(
              color: Color(0xFF16806D),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
