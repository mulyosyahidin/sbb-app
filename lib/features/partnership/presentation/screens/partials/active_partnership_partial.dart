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
  static const _mint = Color(0xFFE0F6EF);
  static const _softGreen = Color(0xFFE9F6DF);
  static const _softGold = Color(0xFFF8EEDC);

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

    return Row(
      children: [
        for (var index = 0; index < tabs.length; index++)
          Expanded(
            child: InkWell(
              onTap: () => onChanged(index),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? _ActivePartnershipPartialState._darkGreen
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    height: 2,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? _ActivePartnershipPartialState._darkGreen
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _ActivePartnershipPartialState._green,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                _ActivePartnershipPartialState._green.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -36,
            top: -46,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.14),
              ),
            ),
          ),
          Positioned(
            left: -56,
            bottom: -70,
            child: Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.34),
                        width: 1.5,
                      ),
                    ),
                    child: const Text(
                      'MM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Martin Mulyo Syahidin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Bergabung sejak 28 April 2026',
                          style: TextStyle(
                            color: Color(0xFFE4F1DE),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      levelLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
      height: 116,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
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
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
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
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 3,
      ),
    );
  }
}

class _PersonalInfoCard extends StatelessWidget {
  const _PersonalInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
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
      padding: const EdgeInsets.all(14),
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
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
    return const Divider(height: 1, color: Colors.black);
  }
}

class _ReferralCodeCard extends StatelessWidget {
  final String? code;

  const _ReferralCodeCard({required this.code});

  @override
  Widget build(BuildContext context) {
    final referralCode = code?.trim().isNotEmpty == true ? code!.trim() : '-';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _ActivePartnershipPartialState._green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.qr_code_2_rounded, color: Colors.white, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kode Referral',
                  style: TextStyle(
                    color: Color(0xFFE4F1DE),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  referralCode,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _ActivePartnershipPartialState._green,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                _ActivePartnershipPartialState._green.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -42,
            top: -54,
            child: Container(
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.14),
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Komisi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Rp 12.500.000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _SummaryMetric(
                      label: 'Bonus Referral',
                      value: 'Rp 1.250.000',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SummaryMetric(
                      label: 'Point Reward',
                      value: '450 Pts',
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
}

class _SummaryMetric extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryMetric({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFE4F1DE),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
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
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF16806D),
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
