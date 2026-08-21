import 'package:app/app/app_router.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _green = Color(0xFF1F6E2D);
const _gold = Color(0xFFD3AB35);
const _cream = Color(0xFFFFFBF2);
const _softGreen = Color(0xFFE9F6DF);
const _softGold = Color(0xFFFFF3CE);

class UnregisteredPartnershipPartial extends StatelessWidget {
  const UnregisteredPartnershipPartial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
            children: const [
              _UnregisteredHero(),
              SizedBox(height: 16),
              _PreparationCard(),
              SizedBox(height: 16),
              _PartnerBenefitCard(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outline.withValues(
                      alpha: 0.7,
                    ),
              ),
            ),
          ),
          child: PrimaryButton(
            label: 'Daftar Kemitraan',
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: () => context.push(Routes.openPartner),
          ),
        ),
      ],
    );
  }
}

class _UnregisteredHero extends StatelessWidget {
  const _UnregisteredHero();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? _gold.withValues(alpha: 0.1)
            : _cream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? _gold.withValues(alpha: 0.3)
              : _gold.withValues(alpha: 0.28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? _gold.withValues(alpha: 0.2)
                      : _gold.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.handshake_outlined,
                  color: _gold,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Belum terdaftar sebagai mitra',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Lengkapi pengajuan kemitraan untuk mulai membuka akses program mitra.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified_user_outlined, color: _green, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Proses pendaftaran membutuhkan data identitas yang valid.',
                    style: TextStyle(fontSize: 12, height: 1.35),
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

class _PreparationCard extends StatelessWidget {
  const _PreparationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data yang perlu dipersiapkan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 12),
          _ChecklistItem(
            icon: Icons.badge_outlined,
            text: 'Nama lengkap sesuai identitas',
          ),
          _ChecklistItem(
            icon: Icons.pin_outlined,
            text: 'NIK 16 digit',
          ),
          _ChecklistItem(
            icon: Icons.home_work_outlined,
            text: 'Alamat lengkap dan aktif',
          ),
          _ChecklistItem(
            icon: Icons.upload_file_outlined,
            text: 'File KTP dalam format PDF atau JPG',
          ),
        ],
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ChecklistItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? _green.withValues(alpha: 0.15)
                  : _softGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: _green, size: 17),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                text,
                style: const TextStyle(fontSize: 13, height: 1.35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerBenefitCard extends StatelessWidget {
  const _PartnerBenefitCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? _green.withValues(alpha: 0.1)
            : _softGreen,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? _green.withValues(alpha: 0.3)
              : _green.withValues(alpha: 0.12),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manfaat menjadi mitra',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 14),
          _BenefitItem(
            icon: Icons.workspace_premium_outlined,
            title: 'Akses program mitra',
            description: 'Ikuti program yang tersedia khusus untuk mitra.',
          ),
          SizedBox(height: 12),
          _BenefitItem(
            icon: Icons.insights_outlined,
            title: 'Peluang pengembangan',
            description: 'Dapatkan ruang untuk memperluas kontribusi.',
          ),
          SizedBox(height: 12),
          _BenefitItem(
            icon: Icons.support_agent_outlined,
            title: 'Pendampingan',
            description: 'Pengajuan dan data mitra dapat ditinjau lebih jelas.',
          ),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? _gold.withValues(alpha: 0.15)
                : _softGold,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: _gold, size: 19),
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
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.35,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
