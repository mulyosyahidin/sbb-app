import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:app/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String contractId = 'SBB-K-2026-039';
    const String status = 'Aktif';
    const double progress = 0.72;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9F5),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Informasi lengkap akad kerjasama',
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hero Summary Card
                          _buildHeroCard(contractId, status, progress),
                          const SizedBox(height: 24),

                          // Informasi Sapi
                          _buildSectionHeader('Informasi Sapi'),
                          const SizedBox(height: 12),
                          _buildDetailCard([
                            _buildDetailRow('ID Kontrak', '#SBB-014'),
                            _buildDetailRow('Jenis', 'Brahman Cross'),
                            _buildDetailRow('Berat Awal', '320 kg'),
                            _buildDetailRow('Berat Sekarang', '415 kg'),
                            _buildDetailRow('Target Berat', '500 kg'),
                          ]),
                          const SizedBox(height: 24),

                          // Rincian Keuangan
                          _buildSectionHeader('Rincian Keuangan'),
                          const SizedBox(height: 12),
                          _buildDetailCard([
                            _buildDetailRow('Modal Investasi', 'Rp 18.000.000'),
                            _buildDetailRow(
                                'Bagi Hasil', '60% (Mitra) / 40% (SBB)'),
                            _buildDetailRow('Estimasi Profit', '+Rp 4.200.000',
                                valueColor: const Color(0xFF468432)),
                          ]),
                          const SizedBox(height: 24),

                          // Jadwal
                          _buildSectionHeader('Jadwal Kontrak'),
                          const SizedBox(height: 12),
                          _buildDetailCard([
                            _buildDetailRow('Tanggal Mulai', '20 Oktober 2025'),
                            _buildDetailRow(
                                'Estimasi Selesai', '20 April 2026'),
                            _buildDetailRow('Durasi', '6 Bulan'),
                          ]),
                          const SizedBox(height: 24),

                          // Timeline Aktivitas
                          _buildSectionHeader('Timeline Aktivitas'),
                          const SizedBox(height: 16),
                          _buildTimelineItem(
                            date: '15 April 2026',
                            time: '09:00',
                            title: 'Pemeriksaan Kesehatan Rutin',
                            desc:
                                'Kondisi sapi sangat sehat, nafsu makan stabil.',
                            isLast: false,
                          ),
                          _buildTimelineItem(
                            date: '10 April 2026',
                            time: '14:30',
                            title: 'Penimbangan Berat Badan',
                            desc: 'Kenaikan berat badan 12kg dalam 2 minggu.',
                            isLast: false,
                          ),
                          _buildTimelineItem(
                            date: '01 April 2026',
                            time: '08:00',
                            title: 'Pemberian Vitamin & Vaksin',
                            desc: 'Pemberian booster vitamin B-Complex.',
                            isLast: true,
                          ),
                          const SizedBox(height: 48),

                          // Action Buttons
                          PrimaryButton(
                            label: 'Laporan Lengkap',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 12),
                          SecondaryButton(
                            label: 'Hubungi Tim',
                            onPressed: () {},
                            icon: const Icon(Icons.chat_outlined, size: 20),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(String id, String status, double progress) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E5135),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E5135).withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID Kontrak',
                    style:
                        AppTextStyles.body(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    id,
                    style: AppTextStyles.title(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.label(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progres Penggemukan',
                          style: AppTextStyles.body(
                              color: Colors.white70, fontSize: 12),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: AppTextStyles.body(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                        color: const Color(0xFFC8E6C9),
                        minHeight: 8,
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

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: const Color(0xFF1A1C19),
      ),
    );
  }

  Widget _buildDetailCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8ECE7)),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.body(
              color: const Color(0xFF747972),
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.body(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: valueColor ?? const Color(0xFF1A1C19),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String date,
    required String time,
    required String title,
    required String desc,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E5135),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: const Color(0xFFE8ECE7),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        date,
                        style: AppTextStyles.body(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: const Color(0xFF1A1C19),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: AppTextStyles.body(
                          fontSize: 11,
                          color: const Color(0xFF747972),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color(0xFF1E5135),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: AppTextStyles.body(
                      fontSize: 13,
                      color: const Color(0xFF747972),
                    ).copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
