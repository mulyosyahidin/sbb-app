import 'package:app/features/partnership/domain/entities/partnership_application.dart';
import 'package:app/features/partnership/presentation/widgets/partnership_info_row.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _green = Color(0xFF1F6E2D);
const _gold = Color(0xFFD3AB35);
const _cream = Color(0xFFFFFBF2);
const _softGreen = Color(0xFFE9F6DF);
const _softGold = Color(0xFFFFF3CE);

class PendingPartnershipPartial extends StatelessWidget {
  final PartnershipApplication application;

  const PendingPartnershipPartial({
    super.key,
    required this.application,
  });

  Future<void> _openIdentityCardFile() async {
    final fileUrl = application.identityCardFile?.fileUrl;
    if (fileUrl == null || fileUrl.isEmpty) return;

    final uri = Uri.parse(fileUrl);
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    final file = application.identityCardFile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PendingHero(application: application),
        const SizedBox(height: 16),
        _ReviewProgressCard(application: application),
        const SizedBox(height: 16),
        _ApplicationSummaryCard(application: application),
        if (file != null) ...[
          const SizedBox(height: 16),
          _DocumentCard(
            file: file,
            onOpen: _openIdentityCardFile,
          ),
        ],
      ],
    );
  }
}

class _PendingHero extends StatelessWidget {
  final PartnershipApplication application;

  const _PendingHero({required this.application});

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
                  color: _gold.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.pending_actions_outlined,
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
                      'Pengajuan sedang direview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tim sedang memeriksa data dan dokumen kemitraan Anda.',
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
            child: Row(
              children: [
                const Icon(Icons.hourglass_top_rounded,
                    color: _green, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    application.statusLabel,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      fontWeight: FontWeight.w700,
                    ),
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

class _ReviewProgressCard extends StatelessWidget {
  final PartnershipApplication application;

  const _ReviewProgressCard({required this.application});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progres pengajuan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          _ProgressItem(
            icon: Icons.check_rounded,
            title: 'Pengajuan diterima',
            description: _submittedLabel,
            isComplete: true,
          ),
          const SizedBox(height: 12),
          const _ProgressItem(
            icon: Icons.manage_search_outlined,
            title: 'Review data',
            description: 'Data identitas dan dokumen sedang diperiksa.',
            isComplete: false,
            isActive: true,
          ),
          const SizedBox(height: 12),
          const _ProgressItem(
            icon: Icons.verified_outlined,
            title: 'Hasil verifikasi',
            description: 'Status akan diperbarui setelah review selesai.',
            isComplete: false,
          ),
        ],
      ),
    );
  }

  String get _submittedLabel {
    final date = application.lastSubmittedAt ?? application.submittedAt;
    if (date == null || date.trim().isEmpty) {
      return 'Pengajuan berhasil dikirim.';
    }

    return 'Dikirim pada $date.';
  }
}

class _ProgressItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isComplete;
  final bool isActive;

  const _ProgressItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isComplete,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isComplete || isActive ? _green : _gold;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: isComplete
                ? _green
                : (Theme.of(context).brightness == Brightness.dark
                    ? _gold.withValues(alpha: 0.15)
                    : _softGold),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            icon,
            color: isComplete ? Colors.white : color,
            size: 19,
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

class _ApplicationSummaryCard extends StatelessWidget {
  final PartnershipApplication application;

  const _ApplicationSummaryCard({required this.application});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan data',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          _LevelBadge(label: application.toLevelLabel),
          const SizedBox(height: 14),
          PartnershipInfoRow(label: 'Nama', value: application.name),
          const SizedBox(height: 10),
          PartnershipInfoRow(label: 'NIK', value: application.nik),
          const SizedBox(height: 10),
          PartnershipInfoRow(label: 'Alamat', value: application.address),
        ],
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  final String label;

  const _LevelBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? _gold.withValues(alpha: 0.15)
            : _softGold,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? _gold.withValues(alpha: 0.3)
              : _gold.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.workspace_premium_outlined, color: _gold, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentCard extends StatelessWidget {
  final PartnershipIdentityCardFile file;
  final VoidCallback onOpen;

  const _DocumentCard({
    required this.file,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Dokumen identitas',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? _green.withValues(alpha: 0.15)
                  : _softGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.description_outlined,
                    color: _green,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.fileName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        file.fileSize,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onOpen,
            icon: const Icon(Icons.open_in_new_rounded, size: 18),
            label: const Text('Lihat Dokumen'),
            style: OutlinedButton.styleFrom(
              foregroundColor: _green,
              side: BorderSide(color: _green.withValues(alpha: 0.35)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
