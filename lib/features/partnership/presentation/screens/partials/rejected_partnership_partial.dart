import 'package:app/app/app_router.dart';
import 'package:app/features/partnership/domain/entities/partnership_application.dart';
import 'package:app/features/partnership/presentation/widgets/partnership_info_row.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _red = Color(0xFFD32F2F);
const _softRed = Color(0xFFFFEBEE);
const _cream = Color(0xFFFFFBF2);
const _gold = Color(0xFFD3AB35);
const _softGold = Color(0xFFFFF3CE);

class RejectedPartnershipPartial extends StatelessWidget {
  final PartnershipApplication application;

  const RejectedPartnershipPartial({
    super.key,
    required this.application,
  });

  List<String> get _reviewNotes {
    return application.reviews
        .map((review) => review.note?.trim())
        .whereType<String>()
        .where((note) => note.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _RejectedHero(application: application),
        const SizedBox(height: 16),
        _ReviewNotesCard(reviewNotes: _reviewNotes),
        const SizedBox(height: 16),
        _RejectedApplicationSummaryCard(
          application: application,
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Perbaiki Data',
          icon: const Icon(Icons.edit_note_outlined),
          onPressed: () => context.push(
            Routes.openPartner,
            extra: application,
          ),
        ),
      ],
    );
  }
}

class _RejectedHero extends StatelessWidget {
  final PartnershipApplication application;

  const _RejectedHero({required this.application});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _red.withValues(alpha: 0.22)),
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
                  color: _softRed,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.report_problem_outlined,
                  color: _red,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pengajuan perlu diperbaiki',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Periksa catatan review, lalu kirim ulang data kemitraan Anda.',
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
              color: Colors.white.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(Icons.edit_note_outlined, color: _red, size: 20),
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

class _ReviewNotesCard extends StatelessWidget {
  final List<String> reviewNotes;

  const _ReviewNotesCard({required this.reviewNotes});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _softRed,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _red.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.feedback_outlined, color: _red, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Catatan perbaikan',
                  style: TextStyle(
                    color: _red,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (reviewNotes.isEmpty)
            Text(
              'Belum ada catatan detail dari reviewer.',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 13,
                height: 1.4,
              ),
            )
          else
            for (final note in reviewNotes) ...[
              _ReviewNoteItem(note: note),
              if (note != reviewNotes.last) const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}

class _ReviewNoteItem extends StatelessWidget {
  final String note;

  const _ReviewNoteItem({required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline_rounded, color: _red, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              note,
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _RejectedApplicationSummaryCard extends StatelessWidget {
  final PartnershipApplication application;

  const _RejectedApplicationSummaryCard({required this.application});

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
            'Data yang diajukan',
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
        color: _softGold,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.18)),
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
